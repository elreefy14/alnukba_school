import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/local/shared_pref.dart';
import 'package:getx_skeleton/firebase_options.dart';
import 'config/theme/my_theme.dart';
import 'app/routes/app_pages.dart';
import 'config/translations/localization_service.dart';
import 'utils/awsome_notification_helper.dart';
import 'utils/fcm_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPref.init();

  // inti fcm services
  await FcmHelper().initFcm();

  // initialize local notifications service
  await AwesomeNotificationsHelper.init();

  //await Firebase.initializeApp(
  //  options: DefaultFirebaseOptions.currentPlatform,
  //);

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      rebuildFactor: (old, data) => true,
      useInheritedMediaQuery: true,
      builder: (context, widget) {
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          title: "IamPack",
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            bool themeIsLight = SharedPref.getThemeIsLight();
            return Theme(
              data: MyTheme.getThemeData(isLight: themeIsLight),
              child: MediaQuery(
                child: widget!,
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              ),
            );
          },
          initialRoute: AppPages.INITIAL,
          defaultTransition: Transition.cupertino,
          translations: LocalizationService.getInstance(),
          locale: LocalizationService.getCurrentLocal(),
          fallbackLocale: Locale('ar', 'AR'),
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
