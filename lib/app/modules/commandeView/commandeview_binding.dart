import 'package:get/get.dart';

import './commandeview_controller.dart';

class CommandeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CommandeViewController>(CommandeViewController());
  }
}
