// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';
import '../../components/screen_title.dart';
import 'commandeview_controller.dart';
import 'widget/commande_card.dart';

class CommandeView extends StatelessWidget {
  CommandeView({super.key});
  CommandeViewController commandeViewController =
      Get.put(CommandeViewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              15.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: ScreenTitle(
                  title: Strings.orders.tr,
                  dividerEndIndent: 280,
                ),
              ),
              20.verticalSpace,
              ...commandeViewController.commandesList
                  .map(
                    (e) => Center(
                      child: CommandeCard(
                        commandModel: e,
                      ),
                    ),
                  )
                  .toList(),
              100.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
/*  ...commandeViewController.commandesList
                .map((e) => Text(e.status))
                .toList()*/
