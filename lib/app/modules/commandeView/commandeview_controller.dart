import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/command_model.dart';
import 'package:getx_skeleton/app/data/models/product_model.dart';
import 'package:getx_skeleton/app/data/remote/firestore_db.dart';
import 'package:getx_skeleton/app/modules/login/login_controller.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:getx_skeleton/utils/constants.dart';
import 'package:logger/logger.dart';

import '../../data/remote/api_call_status.dart';

class CommandeViewController extends GetxController {
  // hold data coming from api
  RxList commandesList = [].obs;
  FireStorDB fireStorDB = FireStorDB();
  LoginController loginController = Get.put(LoginController());
  ApiCallStatus apiCallStatus = ApiCallStatus.holding;

  // getting data from api
  getData() async {
    //todo Get Commandes From FireBase
    //getCommandes();
  }
    RxList<ProductModel> products = RxList<ProductModel>();
  //int totalAmount = 0;
  //var products = List<ProductModel>.empty(growable: true).obs;
  Future addProductToCommand(String commandId, ProductModel product
  ,var total
  ) async {
    await FirebaseFirestore.instance
        .collection(Constants.commandesCollection)
        .doc(commandId)
        .update({
      "products": FieldValue.arrayUnion([
        {
          "id": product.id,
          "price": product.price,
          "qte": 1,
          //todo change the imageUrls to be a list of images and change it string will be better 
         // 'imageUrls': product.images ,
        }
      ])
    });
    // Update the commandeModel's products list
    CommandProductsModel commandProductsModel = CommandProductsModel(
      id: product.id!,
      price: product.price!,
      qte: 1,
    );
      commandesList
        .firstWhere((element) => element.id == commandId)
        .products
        .add(commandProductsModel);

      // Update totalAmount and products list
    //  totalAmount = total + product.price!;
    //  products.add(product);    

      update();
  }


  Future addcommande(CommandModel commandModel) async {
    commandesList.add(commandModel);
    await fireStorDB.insertDocument(
        commandModel.toMap(), Constants.commandesCollection);
    //todo print the commandModel id after adding it to the firebase
    Logger().i(commandModel.id);
    update();
  }

  getCommandes() async {
    Logger().i("commandesList.length");
    Logger().i("commandesList.length");
    try {
      var commandesData = await fireStorDB.getFiltredDocuments(
          collection: Constants.commandesCollection,
          field: "clientId",
          condition: loginController.appUser!.id);
      for (var element in commandesData) {
        commandesList.add(CommandModel.fromMap(element));
      }
    } on Exception catch (e) {
      Logger().e(e);
    }

    Logger().i(commandesList.length);
    update();
  }


  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
