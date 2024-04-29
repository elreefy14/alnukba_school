import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/commandeView/commandeview_binding.dart';
import 'package:getx_skeleton/app/modules/commandeView/commandeview_view.dart';
import 'package:getx_skeleton/app/modules/commande_details/commande_details_view.dart';
import 'package:getx_skeleton/app/modules/login/login_binding.dart';
import 'package:getx_skeleton/app/modules/login/login_view.dart';

import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
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
      name: Routes.CART,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: Routes.NOTIFICATIONS,
      page: () => const NotificationsView(),
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
    GetPage(
      name: Routes.PRODUCT_DETAILS,
      page: () => ProductDetailsView(),
      binding: ProductDetailsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
    ),
  ];
}
