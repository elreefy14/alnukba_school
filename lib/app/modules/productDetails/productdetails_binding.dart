import 'package:get/get.dart';

import './productdetails_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(
      () => ProductDetailsController(),
    );
  }
}
