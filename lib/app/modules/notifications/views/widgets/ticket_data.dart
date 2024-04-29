import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/payment_model.dart';
import 'package:getx_skeleton/app/modules/login/login_controller.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';

class TicketData extends StatelessWidget {
  TicketData({
    Key? key,
    required this.payment,
  }) : super(key: key);
  final Payment payment;
  final LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 120.0,
                height: 25.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(width: 1.0, color: Colors.green),
                ),
                child: Center(
                  child: Text(
                    Strings.payment.tr,
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              Row(
                children: [
                  const Text(
                    'IamPack',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SizedBox(
                      width: 30.w,
                      child: Image.asset("assets/images/app_icon.png"),
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              '${payment.amount} DZ',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ticketDetailsWidget(
                    Strings.username.tr,
                    loginController.appUser!.username!,
                    Strings.paymentDate.tr,
                    payment.dateTime.toString().substring(0, 10)),
                /* Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 52.0),
                  child: ticketDetailsWidget('Flight', '76836A45', 'Gate', '66B'),
                ),*/
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 53.0),
                  child: ticketDetailsWidget('ID', payment.id, Strings.time,
                      payment.dateTime.toString().substring(10, 16)),
                  // "${payment.dateTime.hour}:${payment.dateTime.minute}"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}
