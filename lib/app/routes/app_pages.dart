import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/VideoPlayer/videoplayer_binding.dart';
import 'package:getx_skeleton/app/modules/VideoPlayer/videoplayer_view.dart';
import 'package:getx_skeleton/app/modules/video_list/views/video_player_screen.dart';
import 'package:getx_skeleton/app/modules/commandeView/commandeview_binding.dart';
import 'package:getx_skeleton/app/modules/commandeView/commandeview_view.dart';
import 'package:getx_skeleton/app/modules/commande_details/commande_details_view.dart';
import 'package:getx_skeleton/app/modules/login/login_binding.dart';
import 'package:getx_skeleton/app/modules/login/login_view.dart';

import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/video_list/bindings/video_list_binding.dart';
import '../modules/video_list/views/video_list_screen.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/product_details/bindings/product_details_binding.dart';
import '../modules/product_details/views/product_details_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.BASE,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.Login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.Commandes,
      page: () => CommandeView(),
      binding: CommandeViewBinding(),
    ),
    GetPage(
      name: Routes.video,
      page: () => VideoListScreen(),
      binding: VideoListBinding(),
     // transition: Transition.rightToLeft,
     // transitionDuration: const Duration(milliseconds: 250),
    ),
    //  //video player
     GetPage(
      name: Routes.VIDEO_PLAYER,
      page: () => VideoPlayerScreen(),
      binding: VideoPlayerBinding(),
    ),

    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => NotificationsScreen(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: Routes.CommandeDetails,
      page: () => CommandeDetailsView(),
      binding: CommandeViewBinding(),
    ),
    // GetPage(
    //   name: Routes.PRODUCT_DETAILS,
    //   page: () => ProductDetailsView(),
    //   binding: ProductDetailsBinding(),
    //   transition: Transition.rightToLeft,
    //   transitionDuration: const Duration(milliseconds: 250),
    // ),
  ];
}
