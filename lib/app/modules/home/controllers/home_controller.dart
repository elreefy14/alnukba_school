import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/category_model.dart';
import 'package:getx_skeleton/app/data/remote/firestore_db.dart';
import 'package:getx_skeleton/app/modules/splash/controllers/splash_controller.dart';
import 'package:getx_skeleton/utils/constants.dart';

import '../../../../utils/dummy_helper.dart';
import '../../../data/models/product_model.dart';

class HomeController extends GetxController {
  SplashController _splashController = Get.put(SplashController());
  FireStorDB _fireStorDB = FireStorDB();
  List<ProductModel> products = [];
  late CategoryModel selctedCategory; 
  bool isLoading = true;
  @override
  void onInit() {
    _splashController.getParameters().then((value) => getProducts());
    selctedCategory = _splashController.categoriesList.first;
    super.onInit();
  }
  String? currentCommandId;
  void setCurrentCommandId(String? id) {
    currentCommandId = id;
  }

  late ProductModel product;
  void getProducts() async {
    //products = DummyHelper.products;
    final productsData =
        await _fireStorDB.getListDocuments(Constants.productsCollection, null);
    for (var element in productsData) {
      product = ProductModel.fromMap(element);
      parseData();

      products.add(product);
    }
    isLoading = false;
    update();
  }

  void changeCategory(CategoryModel categoryModel) {
    selctedCategory = categoryModel;
    update();
  }

  void parseData() {
    product.category = _splashController.categoriesList.where((element) {
      // print("${element.id}" "===" "${product.category}");
      return element.id == product.category;
    }).isEmpty
        ? "No Category"
        : _splashController.categoriesList
            .where((element) => element.id == product.category)
            .first
            .name;

    product.unit = _splashController.unitsList.where((element) {
      // print("${element.id}" "===" "${product.category}");
      return element.id == product.unit;
    }).isEmpty
        ? "No Unit"
        : _splashController.unitsList
            .where((element) => element.id == product.unit)
            .first
            .name;
    product.type = _splashController.typesList.where((element) {
      // print("${element.id}" "===" "${product.category}");
      return element.id == product.type;
    }).isEmpty
        ? "No Unit"
        : _splashController.typesList
            .where((element) => element.id == product.type)
            .first
            .name;
  }
}
