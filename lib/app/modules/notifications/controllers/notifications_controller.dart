import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/remote/api_call_status.dart';
import 'package:getx_skeleton/app/data/remote/firestore_db.dart';
import 'package:getx_skeleton/app/modules/login/login_controller.dart';

import '../../../../utils/constants.dart';
import '../../../data/models/payment_model.dart';

class NotificationsController extends GetxController {
  // Services that this controller depend On
  FireStorDB fireStorDB = FireStorDB();
  LoginController loginController = Get.put(LoginController());
  // Varibales
  List<Payment> paymentsList = [];
  ApiCallStatus apiCallStatus = ApiCallStatus.loading;

  void getPayments() async {
    await fireStorDB
        .getFiltredDocuments(
          collection: Constants.paymentsCollection,
          field: 'clientId',
          condition: loginController.appUser!.id,
        )
        .then((value) =>
            paymentsList = value.map((e) => Payment.fromMap(e)).toList())
        .then((value) => apiCallStatus = ApiCallStatus.success)
        .then((value) => update());
  }

  @override
  void onInit() {
   
    getPayments();
    super.onInit();
  }
}
