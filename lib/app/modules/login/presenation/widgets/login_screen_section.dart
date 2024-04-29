// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:getx_skeleton/config/translations/strings_enum.dart';
// import 'package:getx_skeleton/utils/image_constant.dart';

// class LoginScreenSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 15.h),
//       //decoration: AppDecoration.fillIndigo,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           CustomAppBar(
//             actions: [
//               Container(
//                 height: 15.000002.h,
//                 width: 17.380005.h,
//                 margin: EdgeInsets.fromLTRB(19.h, 4.h, 19.h, 5.h),
//                 child: Stack(
//                   alignment: Alignment.centerRight,
//                   children: [
//                     // CustomImageView(
//                     //   imagePath: ImageConstant.imgVector,
//                     //   height: 1.h,
//                     //   width: 17.h,
//                     //   alignment: Alignment.center,
//                     //   margin: EdgeInsets.only(
//                     //     top: 7.h,
//                     //     bottom: 6.h,
//                     //   ),
//                     // ),
//                     //asset image
//                     Image.asset(
//                       ImageConstant.imgVector,
//                       height: 1.h,
//                       width: 17.h,
//                       alignment: Alignment.center,
//                       //margin: EdgeInsets.only(top: 7.h, bottom: 6.h),
//                     ),
//                     // CustomImageView(
//                     //   imagePath: ImageConstant.imgVectorWhiteA700,
//                     //   height: 15.h,
//                     //   width: 8.h,
//                     //   alignment: Alignment.centerRight,
//                     //   margin: EdgeInsets.only(left: 9.h),
//                     // )
//                     //asset image
//                     Image.asset(
//                       ImageConstant.imgVectorWhiteA700,
//                       height: 15.h,
//                       width: 8.h,
//                       alignment: Alignment.centerRight,
//                       //margin: EdgeInsets.only(left: 9.h),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//           SizedBox(height: 16.h),
//           Padding(
//             padding: EdgeInsets.only(right: 25.h),
//             child: Text(
//               //تسجيل دخول
//               Strings.login.tr,
//               style: const TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontFamily: 'Montserrat-Arabic',
//               fontWeight: FontWeight.w400,
//               height: 0.06,
//           ),
//             ),
//           ),
//           SizedBox(height: 28.h),
//         ],
//       ),
//     );
//   }
// }
