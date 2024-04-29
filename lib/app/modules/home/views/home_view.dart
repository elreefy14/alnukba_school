import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/home/views/widgets/category_card.dart';
import 'package:getx_skeleton/app/modules/splash/controllers/splash_controller.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';
import 'package:getx_skeleton/utils/image_constant.dart';
import '../../../components/product_item.dart';
import '../../../components/screen_title.dart';
import '../controllers/home_controller.dart';
import 'widgets/loader.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  SplashController splashController = Get.find();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
        child: Column(
          children: [
            Container(
              width: 275.w,
              height: 91.h,
              padding:  EdgeInsets.symmetric(
                horizontal: 10.w, 
                vertical: 8.h,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(-1, 0),
                  colors: [Color(0xFF4B5EBF), Color(0xFF1D2759)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 75.w,
                      height: 75.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: Stack(children: [
                        // Image.asset(
                        //   'assets/images/Rectangle 1.png',
                        //   width: 75,
                        //   height: 75,
                        //   fit: BoxFit.cover,
                        // ),
                        //svg image
                        SvgPicture.asset(
                          ImageConstant.imgParent,
                          width: 75.w,
                          height: 75.h,
                          fit: BoxFit.cover,
                        ),
                      ]),
                    ),
                     SizedBox(width: 10.w),
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'عبدالرحمن سعيد حسن',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.11,
                              letterSpacing: 0.04,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'الرابع - A -',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 1.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.11,
                              letterSpacing: 0.04,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
//Text(
//   'أحدث الاشعارات',
//   textAlign: TextAlign.right,
//   style: TextStyle(
//     color: Colors.black,
//     fontSize: 14,
//     fontFamily: 'Ink Free',
//     fontWeight: FontWeight.w400,
//     height: 0.12,
//   ),
// )
            SizedBox(height: 20.h),
            Text(
              'أحدث الاشعارات',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontFamily: 'Ink Free',
                fontWeight: FontWeight.w400,
                height: 0.12,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    width: 345,
                    height: 120,
                    margin: EdgeInsets.only(right: 10), // Add some space between cards
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x06000000),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 90,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: Text(
                                          '9:00م',
                                          style: TextStyle(
                                            color: Color(0xFFAEAEAE),
                                            fontSize: 10,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                           // height: 0.24,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'جدول امتحانات نهاية العام الدراسي',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: 'Montserrat-Arabic',
                                        fontWeight: FontWeight.w400,
                                    //    height: 0.17,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      width: 32,
                                      height: 32,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Stack(children: [
                                      //user_grey.svg image
                                        SvgPicture.asset(
                                          ImageConstant.userGrey,
                                          width: 32,
                                          height: 32,
                                          fit: BoxFit.cover,
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      width: 267,
                                      child: Text.rich(
                                        TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'تم رفع جدول امتحان نهاية العام الدراسي على التطبيق كما تم تسليم التلاميذ نسخة, ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontFamily: 'Montserrat-Arabic',
                                                fontWeight: FontWeight.w300,
                                           //     height: 0.17,
                                              ),
                                            ),
                                            TextSpan(
                                              text: 'عرض المزيد.',
                                              style: TextStyle(
                                                color: Color(0xFF2265C3),
                                                fontSize: 10,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w300,
                                                decoration: TextDecoration.underline,
                                             //   height: 0.24,
                                              ),
                                            ),
                                          ],
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
         


          ],
        ),
      ),
    );
  }
}
