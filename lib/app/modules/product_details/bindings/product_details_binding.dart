import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/splash/controllers/splash_controller.dart';

import '../controllers/product_details_controller.dart';

class ProductDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailsController>(
      () => ProductDetailsController(),
    );
    Get.put<SplashController>(
      SplashController(),
    );
  }
}
