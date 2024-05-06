import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/login/login_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:getx_skeleton/utils/constants.dart';
import 'package:logger/logger.dart';
import '../app/data/local/shared_pref.dart';
import '../firebase_options.dart';
import 'package:http/http.dart' as http;

import 'awsome_notification_helper.dart';

class FcmHelper {
  // prevent making instance
  FcmHelper();

  // FCM Messaging
  static late FirebaseMessaging messaging;
  LoginController loginController = Get.put(LoginController());

  /// this function will initialize firebase and fcm instance
  Future<void> initFcm() async {
    try {
      // initialize fcm and firebase core
      await Firebase.initializeApp(
        // TODO: uncomment this line if you connected to firebase via cli
          options: 
          DefaultFirebaseOptions.currentPlatform,

      );
       FirebaseFirestore.instance.settings =
          const Settings(persistenceEnabled: true);

      // initialize firebase
      messaging = FirebaseMessaging.instance;

      // notification settings handler
      await _setupFcmNotificationSettings();

      // generate token if it not already generated and store it on shared pref
      //await generateFcmToken();

      // background and foreground handlers
      FirebaseMessaging.onMessage.listen(_fcmForegroundHandler);
      FirebaseMessaging.onBackgroundMessage(_fcmBackgroundHandler);
    } catch (error) {
      // if you are connected to firebase and still get error
      // check the todo up in the function else ignore the error
      // or stop fcm service from main.dart class
      Logger().e(error);
    }
  }

  ///handle fcm notification settings (sound,badge..etc)
  static Future<void> _setupFcmNotificationSettings() async {
    //show notification with sound and badge
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );

    //NotificationSettings settings
    await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,
    );
  }

  /// generate and save fcm token if its not already generated (generate only for 1 time)
  Future<void> generateFcmToken() async {
    var token = await messaging.getToken();
    if (token != null) {
      SharedPref.setFcmToken(token);
      // _authController.onReady();
      _sendFcmTokenToServer(
        loginController.appUser!.id!,
        token,
      );
    } else {
      // retry generating token
      await Future.delayed(const Duration(seconds: 5));
      generateFcmToken();
    }
  }

  /// this method will be triggered when the app generate fcm
  /// token successfully
  static _sendFcmTokenToServer(String id, String fcm) {
    var token = SharedPref.getFcmToken();
    // TODO SEND FCM TOKEN TO SERVER
    FirebaseFirestore.instance
        .collection(Constants.usersCollection)
        .doc(id)
        .update({'fcmToken': fcm});
  }

  ///handle fcm notification when app is closed/terminated
  /// if you are wondering about this annotation read the following
  /// https://stackoverflow.com/a/67083337
  @pragma('vm:entry-point')
  static Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
    Logger().i(message.notification!.title);
    AwesomeNotificationsHelper.showNotification(
      id: 1,
      title: message.notification?.title ?? 'Tittle',
      body: message.notification?.body ?? 'Body',
      payload: message.data
          .cast(), // pass payload to the notification card so you can use it (when user click on notification)
    );
    //todo: handle notification when click
    //FcmHelper instance = FcmHelper();
    //instance.selectNotification(message.data['payload']);


  }

  //handle fcm notification when app is open
  static Future<void> _fcmForegroundHandler(RemoteMessage message) async {
    Logger().i(message.notification!.title);
    AwesomeNotificationsHelper.showNotification(
      id: 1,
      title: message.notification?.title ?? 'Tittle',
      body: message.notification?.body ?? 'Body',
      payload: message.data
          .cast(), // pass payload to the notification card so you can use it (when user click on notification)
    );
    //todo: handle notification when click
    //  FcmHelper instance = FcmHelper();
    //  instance.selectNotification(message.data['payload']);


  }
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future selectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    // Navigate to Settings screen if payload is 'settings'
    if (payload == 'settings') {
      // Get.toNamed(//appRoutes.settings);
      Get.toNamed(Routes.SETTINGS);
      //navigatorKey.currentState!
      //.push(MaterialPageRoute(builder: (context) => SettingsScreen()));
    }
  }

  static Future<void> newOrderAlert(title, notbody, to,
  //nullable payload
  {String? payload}
  ) async {
    Logger().i("NEW Order ALERT");
    Logger().i("Sending to $to");
    Logger().i(title);
    var body = json.encode({
      "to": to,
      "notification": {
        "body": notbody,
        "title": title,
      },
     //  "data": {
     //   "payload": payload // Add payload here
     // }

    });
    String baseUrl = "https://fcm.googleapis.com/fcm/send";
    var response = await http.post(Uri.parse(baseUrl), body: body, headers: {
      "Content-Type": "application/json",
      "Authorization":
          "key=AAAAtRk8wAw:APA91bG76-JTsiB4GWtxoz37qJ4QeaMt687exnyFsmbJP_01u3rzwx3-gM3PnOTB1SltVxuB4cC46XwZ47vtAuKUfDKbTq1XlPEI2UYoH_3emgY5IG48eMhF2Wb_WL9xl6sZTIuyW2Qu"
    });
    print(response.statusCode);
  }
}
