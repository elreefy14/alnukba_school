import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/login/login_controller.dart';
import 'package:getx_skeleton/app/modules/login/presenation/widgets/CustomAppBar.dart';
import 'package:getx_skeleton/app/modules/login/presenation/widgets/button.dart';
import 'package:getx_skeleton/app/modules/login/presenation/widgets/circle_icon_with_text.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';
import 'package:getx_skeleton/utils/image_constant.dart';



class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
       // title: 'تسجيل دخول',

      ),
       body: GetBuilder<LoginController>(
        builder: (controller) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40.h),
                  child: Column(
                    children: [
                      Container(
                        width: 375.w,
                        height: 111.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color://white
                                  Colors.white,
                              blurRadius: 10,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleIconWithText(
                              svgUrl: ImageConstant.imgTeacher,
                              text: 'معلم',
                            ),
                             SizedBox(width: 25.w),
                            CircleIconWithText(
                              svgUrl: ImageConstant.imgParent,
                              text: 'آباء',
                            ),
                             SizedBox(width: 25.w),
                            CircleIconWithText(
                              svgUrl: ImageConstant.imgAdmin,
                              text: 'أدمن',
                            ), 
                             SizedBox(width: 25.w),
                            CircleIconWithText(
                              svgUrl: ImageConstant.imgManagement,
                              text: 'إدارة',
                            ),
                          ],
                        ),
                      ),
                      //      RowIconSection(),
                      SizedBox(height: 70.h),
                      Container(
                        width: 320.w,
                        height: 56.h,
                        padding: const EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFE2E8F0),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: TextFormField(
                          controller: controller.phoneController,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            labelText: 'اسم المستخدم',
                            labelStyle: TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 16.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child:
                                  //svg image
                                  SvgPicture.asset(
                                ImageConstant.infoIcon,
                                height: 40.h,
                                width: 40.w,
                                alignment: Alignment.center,
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 26.h),
                      Container(
                        width: 320.w,
                        height: 56.h,
                        padding: const EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFFE2E8F0),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: TextFormField(
                          controller: controller.passwordController,
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            labelText: 'كلمة المرور',
                            labelStyle: TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 16.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: SvgPicture.asset(
                                ImageConstant.imgCheckmark,
                                height: 40.h,
                                width: 40.w,
                                alignment: Alignment.center,
                              ),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 32.h),
                     InkWell(
                              onTap: () {
                                if (!controller.isLoding) {
                                  controller.login();
                                }
                              },
                              child: controller.isLoding
                                  ? CircularProgressIndicator()
                                  : Button()),
                     
                      SizedBox(height: 9.h),
                      Text(
                        Strings.signInAsAdmin.tr,
                        style: context.theme.textTheme.bodySmall,
                      ),
                      SizedBox(height: 5.h),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
