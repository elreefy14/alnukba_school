import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/components/custom_textfield.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';

import '../../../../utils/constants.dart';
import '../../../components/custom_button.dart';
import '../../../components/no_data.dart';
import '../../../components/screen_title.dart';
import '../controllers/cart_controller.dart';
import 'widgets/cart_item.dart';

class CartView extends GetView<CartController> {
  CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GetBuilder<CartController>(
          builder: (_) => ListView(
            children: [
              15.verticalSpace,
              ScreenTitle(
                title: Strings.cart.tr,
                dividerEndIndent: 280,
              ),
              20.verticalSpace,
              controller.products.isEmpty
                  ? NoData(text: Strings.noProductInYourCartYet.tr)
                  : ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) => CartItem(
                        product: controller.products[index],
                      ).animate().fade().slideX(
                            duration: const Duration(
                              milliseconds: 300,
                            ),
                            begin: -1,
                            curve: Curves.easeInSine,
                          ),
                      shrinkWrap: true,
                      primary: false,
                    ),
              30.verticalSpace,
              Visibility(
                visible: controller.products.isNotEmpty,
                child: Row(
                  children: [
                    Container(
                      width: 65.w,
                      height: 65.h,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.done_all,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                    20.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Strings.total.tr,
                            style: theme.textTheme.bodyLarge?.copyWith(
                              fontSize: 18.sp,
                            )),
                        10.verticalSpace,
                        Text(
                          '\$${controller.total.toStringAsFixed(2)}',
                          style: theme.textTheme.displayLarge?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor:
                                theme.primaryColor.withOpacity(0.5),
                            decorationThickness: 1,
                            color: Colors.transparent,
                            shadows: [
                              Shadow(
                                  color: theme.textTheme.displayLarge!.color!,
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
              ),
              20.verticalSpace,
              Visibility(
                visible: controller.products.isNotEmpty,
                child: Row(
                  children: [
                    Container(
                      width: 65.w,
                      height: 75.h,
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: SvgPicture.asset(Constants.busIcon),
                    ),
                    20.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Déstination:',
                            style: Get.theme.textTheme.bodyLarge?.copyWith(
                              fontSize: 18.sp,
                            )),
                        10.verticalSpace,
                        SizedBox(
                          width: 200.w,
                          height: 40.h,
                          child: CustomTextField(
                            isTransparent: false,
                            controller: controller.deliveryAddressController,
                            hint: "Destination",
                            iconData: Icons.home_filled,
                            label: "Destination",
                            obscureText: false,
                            textInputType: TextInputType.text,
                            onChanged: (val) {},
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
              ),
              15.verticalSpace,
              30.verticalSpace,
              Visibility(
                visible: controller.products.isNotEmpty,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: CustomButton(
                    text: 'Purchase Now',
                    onPressed: () => controller.onPurchaseNowPressed(),
                    fontSize: 16.sp,
                    radius: 12.r,
                    verticalPadding: 12.h,
                    hasShadow: true,
                    shadowColor: theme.primaryColor,
                    shadowOpacity: 0.3,
                    shadowBlurRadius: 4,
                    shadowSpreadRadius: 0,
                  ).animate().fade().slideY(
                        duration: const Duration(milliseconds: 300),
                        begin: 1,
                        curve: Curves.easeInSine,
                      ),
                ),
              ),
              30.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
