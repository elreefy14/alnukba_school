import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_textfield.dart';
import 'package:getx_skeleton/app/data/models/product_model.dart';
import 'package:getx_skeleton/app/modules/product_details/views/widgets/rounded_button.dart';
import 'package:getx_skeleton/config/theme/light_theme_colors.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_button.dart';
import '../../splash/controllers/splash_controller.dart';
import '../controllers/product_details_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  ProductDetailsView({Key? key}) : super(key: key);
  final ProductModel product = Get.arguments["product"];
  @override
  final ProductDetailsController controller =
      Get.put(ProductDetailsController());
  final CarouselController _controller = CarouselController();
  SplashController splashController = Get.find();
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.height - 30.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 450.h,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 16, 77, 219),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.r),
                        bottomRight: Radius.circular(30.r),
                      ),
                      child: CarouselSlider.builder(
                        carouselController: _controller,
                        options: CarouselOptions(
                          height: 450.h,
                        ),
                        itemCount: product.images!.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            SizedBox(
                          height: 450.h,
                          width: Get.width,
                          child: Image.network(
                            product.images![itemIndex],
                            //height: 700.h,
                            fit: BoxFit.cover,
                          ).animate().slideX(
                                duration: const Duration(milliseconds: 300),
                                begin: 1,
                                curve: Curves.easeInSine,
                              ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30.h,
                      left: 20.w,
                      right: 20.w,
                      // ignore: prefer_const_constructors
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RoundedButton(
                            onPressed: () => Get.back(),
                            child: SvgPicture.asset(Constants.backArrowIcon,
                                fit: BoxFit.none),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 225.h,
                      left: 10.w,
                      right: 10.w,
                      child: SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => _controller.previousPage(),
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () => _controller.nextPage(),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name!,
                        style: theme.textTheme.bodyLarge,
                      ).animate().fade().slideX(
                            duration: const Duration(milliseconds: 300),
                            begin: -1,
                            curve: Curves.easeInSine,
                          ),
                      Text(product.category!,
                              /* splashController.categoriesList
                                      .where((element) =>
                                          element.id == product.category)
                                      .first
                                      .name ??
                                  "",
                                  */
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.w300))
                          .animate()
                          .fade()
                          .slideX(
                            duration: const Duration(milliseconds: 300),
                            begin: -1,
                            curve: Curves.easeInSine,
                          ),
                    ],
                  ),
                ),
                20.verticalSpace,
                product.promoPrice == null
                    ? normalPrice(theme)
                    : promoPrice(theme),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.w),
                //   child: Row(
                //     children: [
                //       Text(
                //         '\$${product.price}',
                //         style: theme.textTheme.displayMedium,
                //       ),
                //       30.horizontalSpace,
                //       const Icon(Icons.star_rounded, color: Color(0xFFFFC542)),
                //       5.horizontalSpace,
                //       Text(
                //         product.rating!.toString(),
                //         style: theme.textTheme.bodyMedium?.copyWith(
                //             fontSize: 18.sp, fontWeight: FontWeight.bold),
                //       ),
                //       5.horizontalSpace,
                //       Text(
                //         '(${product.reviews!})',
                //         style:
                //             theme.textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
                //       ),
                //     ],
                //   ).animate().fade().slideX(
                //         duration: const Duration(milliseconds: 300),
                //         begin: -1,
                //         curve: Curves.easeInSine,
                //       ),
                // ),
                // 20.verticalSpace,
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Text(
                        Strings.quantity.tr,
                        style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 18.sp, fontWeight: FontWeight.bold),
                      ).animate().fade().slideX(
                            duration: const Duration(milliseconds: 300),
                            begin: -1,
                            curve: Curves.easeInSine,
                          ),
                      GetBuilder<ProductDetailsController>(
                        builder: (_) => Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // FloatingActionButton(onPressed: () {}),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        LightThemeColors.accentColor,
                                    shape: const CircleBorder(),
                                    fixedSize: Size(20.w, 20.w),
                                  ),
                                  onPressed: () {
                                    controller.changeQty(-1);
                                  },
                                  child: const Icon(
                                    Icons.remove_circle,
                                    color: Colors.white,
                                    size: 25,
                                  )),

                              Expanded(
                                child: Container(
                                  //color: Colors.amber,
                                  child: SizedBox(
                                    height: 45.h,
                                    child: TextField(
                                      //  iconData: Icons.numbers,
                                      controller: controller.qtyController,

                                      // label: "",
                                      obscureText: false,

                                      style: TextStyle(fontSize: 20.sp),
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText: "10",
                                        contentPadding:
                                            EdgeInsets.only(bottom: 10.w),
                                        hintStyle: TextStyle(fontSize: 18.sp),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                color: LightThemeColors
                                                    .primaryColor)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: LightThemeColors
                                                    .primaryColor)),
                                      ),
                                      // textInputType: TextInputType.number,
                                      onChanged: (val) {},
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        LightThemeColors.accentColor,
                                    shape: const CircleBorder(),
                                    fixedSize: Size(20.w, 20.w),
                                  ),
                                  onPressed: () {
                                    controller.changeQty(1);
                                  },
                                  child: const Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                  )),
                            ],
                          ).animate().fade().slideX(
                                duration: const Duration(milliseconds: 300),
                                begin: -1,
                                curve: Curves.easeInSine,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                10.verticalSpace,
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child:
                      GetBuilder<ProductDetailsController>(builder: (context) {
                    return CustomButton(
                      text: Strings.addToCart.tr,
                      onPressed: () => controller.onAddToCartPressed(product),
                      disabled: controller.qtyController.text.isEmpty ||
                          controller.qtyController.text == "0",
                      fontSize: 16.sp,
                      radius: 12.r,
                      verticalPadding: 12.h,
                      hasShadow: true,
                      backgroundColor: LightThemeColors.primaryColor,
                      shadowColor: theme.primaryColor,
                      shadowOpacity: 0.3,
                      shadowBlurRadius: 4,
                      shadowSpreadRadius: 0,
                    ).animate().fade().slideY(
                          duration: const Duration(milliseconds: 300),
                          begin: 1,
                          curve: Curves.easeInSine,
                        );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget promoPrice(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Text(
            Strings.prix.tr,
            style: theme.textTheme.bodyMedium
                ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ).animate().fade().slideX(
                duration: const Duration(milliseconds: 300),
                begin: -1,
                curve: Curves.easeInSine,
              ),
          const Spacer(),
          Text('${product.promoPrice} DZD',
                  style: theme.textTheme.displayMedium)
              .animate()
              .fade()
              .slideY(
                duration: const Duration(milliseconds: 200),
                begin: 2,
                curve: Curves.easeInSine,
              ),
          20.horizontalSpace,
          Text(
            '${product.price.toString()} DZD',
            style: theme.textTheme.displayMedium!.copyWith(
                decoration: TextDecoration.lineThrough,
                fontWeight: FontWeight.w200,
                color: Colors.blueGrey),
          ).animate().fade().slideY(
                duration: const Duration(milliseconds: 200),
                begin: 1,
                curve: Curves.easeInSine,
              ),
        ],
      ),
    );
  }

  Widget normalPrice(ThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Text(
            Strings.prix.tr,
            style: theme.textTheme.bodyMedium
                ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ).animate().fade().slideX(
                duration: const Duration(milliseconds: 300),
                begin: -1,
                curve: Curves.easeInSine,
              ),
          const Spacer(),
          Text('DZ ${product.price}', style: theme.textTheme.displayMedium)
              .animate()
              .fade()
              .slideY(
                duration: const Duration(milliseconds: 200),
                begin: 2,
                curve: Curves.easeInSine,
              ),
        ],
      ),
    );
  }
}
