import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/login/login_controller.dart';

import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
    Get.put(LoginController());
  }
}
