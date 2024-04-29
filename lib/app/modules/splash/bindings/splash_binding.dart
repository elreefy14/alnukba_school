import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/login/login_controller.dart';

import '../controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
      SplashController(),
      permanent: true,
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
