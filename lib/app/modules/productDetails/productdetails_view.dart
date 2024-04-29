import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/data/models/command_model.dart';

import './productdetails_controller.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({super.key, required this.commandModel});
  final CommandModel commandModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
        builder: (controller) {
          return const Center(child: Text("productDetailsView"));
        },
      ),
    );
  }
}
