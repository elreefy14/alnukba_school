import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/notification_model.dart';
import 'package:getx_skeleton/app/data/models/user_model.dart';
import 'package:getx_skeleton/app/modules/home/views/widgets/custom_container_for_home_screen.dart';
import 'package:getx_skeleton/app/modules/splash/controllers/splash_controller.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';
import 'package:getx_skeleton/utils/image_constant.dart';
import 'package:intl/intl.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  SplashController splashController = Get.find();
  //homeController
  //HomeController homeController = Get.find();
  //UserModel? get appUser => splashController.loginController.appUser;
  UserModel? get appUser => splashController.appUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            // IconButton(
            //   icon: Icon(Icons.menu), // Replace with your leading icon
            //   onPressed: () {
            //     // Handle leading icon press
            //   },
            // ),
            //svg image
            Padding(
          padding: EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            ImageConstant.list,
            width: 23.w,
            height: 23.h,
            color: //color from theme coleor for icon
                Colors.white,
            // fit: BoxFit.cover,
          ),
        ),
        centerTitle: true,
        title: Text(
          Strings.mainScreenTitle.tr,
          style: 
          Theme.of(context).
          textTheme.
          labelLarge
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                SvgPicture.asset(
                  ImageConstant.notifications,
                  width: 35.w,
                  height: 35.h,
                ),
                if (this.appUser!.unreadNotifications == 0)
                  Container()
                else
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: ShapeDecoration(
                      color: Color(0xFFFF2C20),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignOutside,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => Text(
                              this.appUser!.unreadNotifications.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                height: 0.11,
                                letterSpacing: 0.04,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 20.h),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                width: 275.w,
                height: 91.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 8.h,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [
                      Color(0xFF1D2759),
                      Color(0xFF4B5EBF),
                    ],
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                              this.appUser!.fullName ?? 'no',
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
              SizedBox(height: 20.h),
              if (this.appUser!.unreadNotifications == 0)
                Container()
                else
              Padding(
                padding: EdgeInsets.only(
                  right: 15.w,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'أحدث الاشعارات',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: 'Ink Free',
                      fontWeight: FontWeight.w400,
                      //  height: 0.12,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              //if number of user.unreadnotification is 0 i will show empty builder
              if (this.appUser!.unreadNotifications == 0)
                Container()
                else
              Container(
                width: double.infinity,
                height: 120.h,
                child: FirestoreListView(
                  cacheExtent: 1000,
                  query: FirebaseFirestore.instance
                      .collection('users')
                      .doc(splashController.user!.uid)
                      .collection('notifications')
                      .orderBy('timestamp', descending: true)
                      .limit(2),
                  pageSize: 2,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  emptyBuilder: (context) =>
                      Center(child: Text('لا يوجد اشعارات حاليا')),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, snapshot) {
                    final notification =
                        NotificationModel.fromMap(snapshot.data()!);
                    //i want to check on first notification if it is read or not if not i will mak appuser.unreadnotification equal 0
                     //  homeController.updateUnreadNotifications(notification);


                    return Container(
                      width: 345.w,
                      margin: EdgeInsets.only(left: 10.w),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
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
                        children: [
                          Container(
                            width: double.infinity,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(),
                                        child: Stack(children: [
                                          SvgPicture.asset(
                                            ImageConstant.userGrey,
                                            width: 32,
                                            height: 32,
                                            fit: BoxFit.cover,
                                          ),
                                        ]),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        notification.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontFamily: 'Montserrat-Arabic',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        DateFormat('h:mm a')
                                            .format(notification.timestamp),
                                        style: TextStyle(
                                          color: Color(0xFFAEAEAE),
                                          fontSize: 10,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: 267,
                                        child: Text(
                                          notification.body,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontFamily: 'Montserrat-Arabic',
                                            fontWeight: FontWeight.w300,
                                          ),
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
              //SizedBox(height: 20.h),
              //  CustomContainer(svgPath: ImageConstant.studentBehavior, title: 'سلوك الطالب'),
              Padding(
                padding: EdgeInsets.only(
                  top: 0.h,
                ),
                child: Container(
                  //width: double.infinity,
                  height: 500.h,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    children: <Widget>[
                      CustomContainer(
                          svgPath: ImageConstant.studentBehavior,
                          title: 'سلوك الطالب'),
                      CustomContainer(
                          svgPath: ImageConstant.onlineLessons,
                          title: 'دروس اونلاين'),
                      CustomContainer(
                          svgPath: ImageConstant.dailyHomework,
                          title: 'الواجبات اليومية'),
                      CustomContainer(
                          svgPath: ImageConstant.examSchedule,
                          title: 'جدول الامتحانات'),
                      CustomContainer(
                          svgPath: ImageConstant.lessonSchedule,
                          title: 'جدول الدروس'),
                      CustomContainer(
                          svgPath: ImageConstant.attendance,
                          title: 'الحضور والغياب'),
                      CustomContainer(
                          svgPath: ImageConstant.grades, title: 'الدرجات'),
                      CustomContainer(
                          svgPath: ImageConstant.annualFees,
                          title: 'الاقساط السنوية'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
