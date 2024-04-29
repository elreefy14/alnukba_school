import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/modules/commandeView/commandeview_controller.dart';
import 'package:getx_skeleton/app/modules/home/controllers/home_controller.dart';
import 'package:getx_skeleton/utils/constants.dart';
import 'package:logger/logger.dart';

import '../../../data/models/product_model.dart';
import '../../cart/controllers/cart_controller.dart';

class ProductDetailsController extends GetxController {
  // for the product size
  var selectedSize = 'M';
  String? currentCommandId; // Define currentCommandId

  TextEditingController qtyController = TextEditingController();
  HomeController homeController = Get.put(HomeController());

  /// when the user press on add to cart button
  onAddToCartPressed(ProductModel product) {

   // print("ProductDetailsController: onAddToCartPressed: mProduct\n\n\n: $mProduct");
    print("ProductDetailsController: onAddToCartPressed: currentCommandId\n\n\n: $currentCommandId");
    
   // if (currentCommandId != null) {
      // Add the product to the Firebase collection
      //logger
    //  Logger().i("ProductDetailsController: onAddToCartPressed: addProductToCommand: currentCommandId: $currentCommandId");
      //logger mproduct json
    //  Logger().i("ProductDetailsController: onAddToCartPressed: addProductToCommand: mProduct: ${mProduct.toJson()}");
     // Get.find<CommandeViewController>()
         // .addProductToCommand(currentCommandId!, mProduct);
       //   .addProductToCommand(currentCommandId!, product);
   // }
   // else{
          var mProduct =
          homeController.products.firstWhere((p) => p.id == product.id);
      mProduct.quantity = int.parse(qtyController.text);
    Get.find<CartController>().getCartProducts();
    //}
    Get.back();
  }

  Future addProductToCommand(String commandId, ProductModel product) async {
    // update the command with the new product added to it
    await FirebaseFirestore.
    instance.
    collection(Constants.commandesCollection).
    doc(commandId).
    update({
      "products": FieldValue.arrayUnion([product.toJson()])
    });
    update();
  }

  /// change the selected size
  changeQty(int addedQte) {
    qtyController.text = addedQte == -1 && qtyController.text == "0"
        ? "0"
        : (int.parse(qtyController.text.isEmpty ? "0" : qtyController.text) +
                addedQte)
            .toString();
    update();
  }
}