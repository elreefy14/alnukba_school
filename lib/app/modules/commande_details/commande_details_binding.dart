import 'package:get/get.dart';

import './commande_details_controller.dart';

class CommandeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommandeDetailsController>(
      () => CommandeDetailsController(),
    );
  }
}
