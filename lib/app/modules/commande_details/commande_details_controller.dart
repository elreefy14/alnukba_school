import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/product_model.dart';
//import 'package:getx_skeleton/app/data/services/firebase_service.dart';
import 'package:getx_skeleton/utils/constants.dart';

class CommandeDetailsController extends GetxController {
  //final FirebaseService fireStorDB = Get.find<FirebaseService>();
   RxList<ProductModel> products = RxList<ProductModel>();

  Future addProductToCommand(String commandId, ProductModel product) async {
    // Add the product to the command in Firebase
   // await fireStorDB.updateDocument(Constants.commandesCollection, commandId, {
  //    'products': FieldValue.arrayUnion([product.toMap()])
  //  });
  await FirebaseFirestore.
  instance.
  collection(Constants.commandesCollection)
  .doc(commandId).
   update({
    "products": FieldValue.arrayUnion([product.toMap()])
   });
   update();
  }

}