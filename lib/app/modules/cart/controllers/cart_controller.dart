import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/command_model.dart';
import 'package:getx_skeleton/app/modules/base/controllers/base_controller.dart';
import 'package:getx_skeleton/app/modules/login/login_controller.dart';
import 'package:getx_skeleton/app/modules/splash/controllers/splash_controller.dart';
import '../../../components/custom_snackbar.dart';
import '../../../data/models/product_model.dart';
import '../../commandeView/commandeview_controller.dart';
import '../../home/controllers/home_controller.dart';

class CartController extends GetxController {
  // to hold the products in cart
  List<ProductModel> products = [];
  LoginController loginController = Get.put(LoginController());
  SplashController splashController = Get.put(SplashController());
  HomeController homeController = Get.put(HomeController());

  TextEditingController deliveryAddressController = TextEditingController();
  CommandeViewController commandeViewController =
      Get.put(CommandeViewController());
  // to hold the total price of the cart products
  var total = 0.0;

  @override
  void onInit() {
    getCartProducts();
    super.onInit();
  }

  /// when the user press on purchase now button
  onPurchaseNowPressed() {
    List<CommandProductsModel> commandProducts = [];
    try {
      
      placeProductsInCommande(commandProducts);
      CommandModel commandModel = CommandModel(
          clientId: loginController.appUser!.id,
          dateTime: DateTime.now(),
          products: commandProducts,
          status: Status.New,
          prixTotal: double.parse(
            total.toStringAsFixed(2),
          ),
          deliveryAddress: deliveryAddressController.text);
      // print(commandModel.toMap());
      commandeViewController.addcommande(commandModel);
      CustomSnackBar.showCustomSnackBar(
          title: 'Purchased', message: 'Order placed with success');
      products = [];
      commandProducts = [];
      update();
      Get.find<BaseController>().changeScreen(0);
    } on Exception catch (e) {
      CustomSnackBar.showCustomErrorSnackBar(
          title: 'Error', message: e.toString());
    }
  }

  // A function that takes a list of CommandProductsModel and adds products to it based on the elements in the products list.
  void placeProductsInCommande(List<CommandProductsModel> commandProducts) {
    for (var element in products) {
      commandProducts.add(CommandProductsModel(
          id: element.id.toString(),
          qte: element.quantity!,
          price: element.promoPrice ?? element.price!));
    }
  }

  /// when the user press on increase button
  onIncreasePressed(String productId) {
    var product = homeController.products.firstWhere((p) => p.id == productId);
    product.quantity = product.quantity! + 1;
    getCartProducts();
    update(['ProductQuantity']);
  }

  /// when the user press on decrease button
  onDecreasePressed(String productId) {
    var product = homeController.products.firstWhere((p) => p.id == productId);
    if (product.quantity != 0) {
      product.quantity = product.quantity! - 1;
      getCartProducts();
      update(['ProductQuantity']);
    }
  }

  /// when the user press on delete icon
  onDeletePressed(String productId) {
    var product = homeController.products.firstWhere((p) => p.id == productId);
    product.quantity = 0;
    getCartProducts();
  }

  /// get the cart products from the product list
  getCartProducts() {
    products = homeController.products.where((p) => p.quantity! > 0).toList();
    // calculate the total price
    total = products.fold<double>(
        0, (p, c) => p + (c.promoPrice ?? c.price)! * c.quantity!);
    update();
  }
}
