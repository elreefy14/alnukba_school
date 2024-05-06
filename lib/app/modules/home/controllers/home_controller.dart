import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/category_model.dart';
import 'package:getx_skeleton/app/data/models/notification_model.dart';
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
    //_splashController.getParameters().then((value) => getProducts());
    //selctedCategory = _splashController.categoriesList.first;
    //putDummyDataToNotificationInFirestore();
    super.onInit();
  }

  final SplashController splashController = Get.find();
  //when to call this function
  //ok //first when user clik on notification icon
  //second when user
  void updateUnreadNotifications(NotificationModel notification) {
    if (notification.isRead == false &&
        splashController.appUser!.unreadNotifications.value != 0) {
      Future.microtask(() {
        //todo: update unreadNotifications to be equal zero in firestore
        splashController.appUser!.unreadNotifications.value =
            splashController.appUser!.unreadNotifications.value - 1;

        WriteBatch batch = FirebaseFirestore.instance.batch();

        DocumentReference userRef = FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid);
        batch.update(userRef, {
          'unreadNotifications':
              splashController.appUser!.unreadNotifications.value
        });

        DocumentReference notificationRef =
            userRef.collection('notifications').doc(notification.id);
        batch.update(notificationRef, {'isRead': true});

        batch
            .commit()
            .then((value) => print("Batch success"))
            .catchError((error) => print("Batch failed: $error"));
      });
    }
  }

  //can u put 100 notification in firestore
  //contain quotes to be happy
  Future<void> putDummyDataToNotificationInFirestore() async {
    CollectionReference notifications = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('notifications');

    List<String> quotes = [
      // Add your list of 100 quotes here
      "Quote 1",
      "Quote 2",
      "Quote 3",
      // ...
    ];

    for (var i = 0; i < 100; i++) {
      var now = DateTime.now();
      var randomTimestamp = now.subtract(Duration(days: Random().nextInt(30)));

      var dummyNotification = NotificationModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: 'Quote to be happy',
        body: quotes[i % quotes.length], // Use modulo to avoid index out of range
        timestamp: randomTimestamp,
        isRead: false,
      );

      await notifications
          .doc(dummyNotification.id)
          .set(dummyNotification.toMap());
    }
  }

  // late ProductModel product;
  // void getProducts() async {
  //   //products = DummyHelper.products;
  //   final productsData =
  //       await _fireStorDB.getListDocuments(Constants.productsCollection, null);
  //   for (var element in productsData) {
  //     product = ProductModel.fromMap(element);
  //     parseData();

  //     products.add(product);
  //   }
  //   isLoading = false;
  //   update();
  // }

  void changeCategory(CategoryModel categoryModel) {
    selctedCategory = categoryModel;
    update();
  }

  // void parseData() {
  //   product.category = _splashController.categoriesList.where((element) {
  //     // print("${element.id}" "===" "${product.category}");
  //     return element.id == product.category;
  //   }).isEmpty
  //       ? "No Category"
  //       : _splashController.categoriesList
  //           .where((element) => element.id == product.category)
  //           .first
  //           .name;

  //   product.unit = _splashController.unitsList.where((element) {
  //     // print("${element.id}" "===" "${product.category}");
  //     return element.id == product.unit;
  //   }).isEmpty
  //       ? "No Unit"
  //       : _splashController.unitsList
  //           .where((element) => element.id == product.unit)
  //           .first
  //           .name;
  //   product.type = _splashController.typesList.where((element) {
  //     // print("${element.id}" "===" "${product.category}");
  //     return element.id == product.type;
  //   }).isEmpty
  //       ? "No Unit"
  //       : _splashController.typesList
  //           .where((element) => element.id == product.type)
  //           .first
  //           .name;
  // }
}
