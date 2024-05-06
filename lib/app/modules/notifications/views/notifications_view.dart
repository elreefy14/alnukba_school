import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/notification_model.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_skeleton/app/modules/home/controllers/home_controller.dart';
import 'package:getx_skeleton/app/modules/splash/controllers/splash_controller.dart';

class NotificationsScreen extends StatelessWidget {
  final splashController = Get.find<SplashController>();
  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        child: Expanded(
          child: FirestoreListView(
            query: FirebaseFirestore.instance
                .collection('users')
                .doc(splashController.user!.uid)
                .collection('notifications')
                .orderBy('timestamp', descending: true)
                .limit(2),
                cacheExtent: 1000,
            pageSize: 2,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            emptyBuilder: (context) =>
                Center(child: Text('لا يوجد اشعارات حاليا')),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, snapshot) {
              final notification =
                  NotificationModel.fromMap(snapshot.data()!);
              // homeController.updateUnreadNotifications(notification);
              return _buildNotificationItem(notification);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(NotificationModel notification) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: notification.isRead
            ? Colors.white
            : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/notification.svg',
            width: 40.w,
            height: 40.h,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  notification.body,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  DateFormat('h:mm a').format(notification.timestamp),
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}