// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:getx_skeleton/app/modules/login/presenation/widgets/button.dart';
// import 'package:getx_skeleton/app/modules/login/presenation/widgets/login_screen_section.dart';
// import 'package:getx_skeleton/app/modules/login/presenation/widgets/row_icon_section.dart';
// import 'package:getx_skeleton/config/translations/strings_enum.dart';
// import 'package:getx_skeleton/utils/image_constant.dart';

// class SignInScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SizedBox(
//           width: double.maxFinite,
//           child: Column(
//             children: [
//               LoginScreenSection(),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 40.h),
//                 child: Column(
//                   children: [
//                     RowIconSection(),
//                     SizedBox(height: 32.h),
//                    Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 27.h),
//                       child: CustomTextFormField(
//                        // controller:
//                        // context.read<LoginCubit>().phoneController,
//                         hintText: Strings.username.tr,
//                         prefix: Container(
//                           margin: EdgeInsets.fromLTRB(16.h, 
//                           16.h,
//                           30.h,
//                            16.h),
//                           child: 
//                           //CustomImageView(
//                           //  imagePath: ImageConstant.imgInbox,
//                           //  height: 24.h,
//                           //  width: 24.w,
//                           //),
//                           //asset image
//                           Image.asset(ImageConstant.imgInbox,
//                            height: 24.h, width: 24.w, 
//                            alignment: Alignment.center),

      
//                         ),
//                         prefixConstraints: BoxConstraints(
//                           maxHeight: 56.h,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 26.h),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 27.h),
//                       child: CustomTextFormField(
//                       //    controller:
//                      //   context.read<LoginCubit>().passwordController,
//                         hintText: Strings.userpassword.tr,
//                         textInputAction: TextInputAction.done,
//                         prefix: Container(
//                           margin: EdgeInsets.fromLTRB(16.h,
//                            16.h,
//                             30.h, 
//                             16.h),
//                           child: 
//                           //CustomImageView(
//                            // imagePath: ImageConstant.imgCheckmark,
//                            // height: 24.h,
//                            // width: 24.w,
//                           //),
//                           //asset image
//                           Image.asset(ImageConstant.imgCheckmark,
//                            height: 24.h, width: 24.w, 
//                            alignment: Alignment.center
//                           ),
//                         ),
//                         prefixConstraints: BoxConstraints(
//                           maxHeight: 56.h,
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 32.h),
//                     Button(),
//                     SizedBox(height: 9.h),
//                     Text(
//                       Strings.signInAsAdmin.tr,
              
//                       style: const TextStyle(
//                     color: Color(0xD81570EF),
//                     fontSize: 12,
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w300,
//                     decoration: TextDecoration.underline,
//                     height: 0.17,
//                   ),
//                     ),
//                     SizedBox(height: 5.h),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
