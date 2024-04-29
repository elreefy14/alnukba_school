import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/product_model.dart';
import 'package:getx_skeleton/app/modules/commandeView/commandeview_controller.dart';
import 'package:getx_skeleton/app/modules/commande_details/widgets/command_product_item.dart';
import 'package:getx_skeleton/app/modules/home/controllers/home_controller.dart';
import 'package:getx_skeleton/app/modules/product_details/controllers/product_details_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../../../utils/constants.dart';
import '../../components/screen_title.dart';
import '../../data/models/command_model.dart';

class CommandeDetailsView extends StatelessWidget {
  CommandeDetailsView({super.key});

  CommandModel commandeModel = Get.arguments["commande"];

  //HomeController homeController = Get.put(HomeController());
  final HomeController homeController = Get.find<HomeController>();

  final CommandeViewController commandeViewController = Get.find();

  @override
  Widget build(BuildContext context) {
    double total = 0;
    commandeModel.products.forEach((element) {
      total = total + element.price * element.qte;
    });
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                15.verticalSpace,
                ScreenTitle(
                  title: Strings.details.tr,
                  dividerEndIndent: 280,
                ),
                5.verticalSpace,
                Container(
                  width: double.infinity,
                  height: Get.height * 0.05,
                  decoration: BoxDecoration(
                    color: TinyColor.fromColor(getColor(commandeModel.status))
                        .brighten(25)
                        .color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      CommandModel.toStringToDisplay(commandeModel.status),
                      style: Get.textTheme.bodyLarge!.copyWith(
                        color: getColor(commandeModel.status),
                      ),
                    ),
                  ),
                ),

                // 15.verticalSpace,
                // FloatingActionButton(
                //   child: Icon(Icons.add),
                //   onPressed: () {
                //     //todo : i think get put is not best solution here
        
                //     Get.put(ProductDetailsController()).currentCommandId = commandeModel.id;
                //     Get.toNamed(Routes.HOME);
                //   },
                // ),
                //
                //i want to make horizontal list of all products which
              
                15.verticalSpace,
  Container(
  height: 200,
  width: double.infinity,
  child: ListView.builder(
    physics: BouncingScrollPhysics(),
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: homeController.products.length, // Use homeController.products
    itemBuilder: (context, index) {
      ProductModel product = homeController.products[index]; // Use homeController.products

      return GestureDetector(
        onTap: () async {
          await commandeViewController.addProductToCommand(
            commandeModel.id!,
            product,
            total,
          );
          // Force update the UI
          commandeViewController.update();
        },
        child: Card(
          child: Column(
            children: <Widget>[
              //any random network image
              Image.network('https://via.placeholder.com/150'),
              Text(product.name?? ""),
              Text(product.price.toString()),
            ],
          ),
        ),
      );
    },
  ),
),
          15.verticalSpace,
                ListView.builder(
                  itemCount: commandeModel.products.length,
                  itemBuilder: (context, index) {
                    //print("commandeModel.products[index].id: ${commandeModel.products[index].id}");
                    ProductModel productModel = homeController.products
                        .where((element) =>
                            element.id == commandeModel.products[index].id)
                        .first;
                    productModel.quantity = commandeModel.products[index].qte;
                    return ProductCommandeItem(
                      product: productModel,
                    ).animate().fade().slideX(
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                          begin: -1,
                          curve: Curves.easeInSine,
                        );
                  },
                  shrinkWrap: true,
                  primary: false,
                ),
                15.verticalSpace,
                Row(
                  children: [
                    Container(
                      width: 65.w,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.done_all,
                            color: Colors.white,
                          ),
                          5.verticalSpace,
                          Text(
                            'TTC',
                            style: Get.theme.textTheme.displaySmall?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    20.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.total.tr,
                            style: Get.theme.textTheme.bodyLarge?.copyWith(
                              fontSize: 18.sp,
                            )),
                        10.verticalSpace,
                        Text(
                          'DZD ${total.toStringAsFixed(2)}',
                          style: Get.theme.textTheme.displayLarge?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor:
                                Get.theme.primaryColor.withOpacity(0.5),
                            decorationThickness: 1,
                            color: Colors.transparent,
                            shadows: [
                              Shadow(
                                  color:
                                      Get.theme.textTheme.displayLarge!.color!,
                                  offset: const Offset(0, -5)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ).animate().fade().slideX(
                      duration: const Duration(milliseconds: 300),
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
                15.verticalSpace,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 65.w,
                      height: 65.h,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: SvgPicture.asset(Constants.busIcon,
                          fit: BoxFit.contain),
                    ),
                    20.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.destination.tr,
                          style: Get.theme.textTheme.bodyLarge?.copyWith(
                            fontSize: 18.sp,
                          ),
                        ),
                        10.verticalSpace,
                        SizedBox(
                          width: 250.w,
                          child: Text(
                            commandeModel.deliveryAddress ?? "",
                            softWrap: true,
                            style: Get.theme.textTheme.displayLarge?.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  Get.theme.primaryColor.withOpacity(0.5),
                              decorationThickness: 1,
                              color: Colors.transparent,
                              shadows: [
                                Shadow(
                                    color: Get
                                        .theme.textTheme.displayLarge!.color!,
                                    offset: const Offset(0, -5)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ).animate().fade().slideX(
                      duration: const Duration(milliseconds: 300),
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
                15.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(Status status) {
    switch (status) {
      case Status.New:
        return const Color.fromARGB(255, 177, 133, 0);
      case Status.Validated:
        return Colors.blue;
      case Status.Shipped:
        return const Color.fromARGB(255, 192, 86, 15);
      case Status.Deliverd:
        return Colors.green;

      default:
        return const Color.fromARGB(255, 177, 133, 0);
    }
  }
}
