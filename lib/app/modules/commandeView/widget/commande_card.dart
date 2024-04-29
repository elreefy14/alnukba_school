import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/app/routes/app_pages.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';
import 'package:tinycolor2/tinycolor2.dart';

import '../../../data/models/command_model.dart';
import '../../home/controllers/home_controller.dart';

class CommandeCard extends StatelessWidget {
  CommandModel commandModel;
  HomeController homeController = Get.put(HomeController());
  CommandeCard({
    Key? key,
    required this.commandModel,
  }) : super(key: key);

  String getTitle() {
    String title = "";
    for (var element in commandModel.products) {
      title =
          "$title ${homeController.products.where((e) => element.id == e.id).isEmpty ? 'Empty' : homeController.products.where((e) => element.id == e.id).first.name!}";
    }
    return title;
  }

//
  @override
  Widget build(BuildContext context) {
    // commandModel.status = Status.Deliverd;
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.CommandeDetails,
            arguments: {"commande": commandModel});
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: const Offset(5.0, 5.0),
              blurRadius: 10.0,
              spreadRadius: 2.0,
              // Optional: controls how much the shadow spreads
            ),
          ],
        ),
        width: Get.width * 0.9,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getIcon(commandModel.status),
                20.horizontalSpace,
                Expanded(
                  child: Text(
                    getTitle(),
                    softWrap: true,
                    style: Get.textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.menu_sharp),
              ],
            ),
            8.verticalSpace,
            ticketDetailsWidget(
              Strings.destination.tr,
              commandModel.deliveryAddress ?? "",
              Strings.total.tr,
              "${commandModel.prixTotal}" + " DA",
              Strings.orderDate.tr,
              commandModel.dateTime.toString().substring(0, 9),
              Strings.time.tr,
              commandModel.dateTime.toString().substring(11, 16),
            ),
            16.verticalSpace,
            Container(
              width: Get.width * 0.8,
              height: Get.height * 0.05,
              decoration: BoxDecoration(
                color: TinyColor.fromColor(getColor(commandModel.status))
                    .brighten(25)
                    .color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  CommandModel.toStringToDisplay(commandModel.status),
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: getColor(commandModel.status),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getIcon(Status status) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: TinyColor(getColor(status)).brighten(30).color,
      ),
      child: Icon(
        getIconData(status),
        color: getColor(status),
      ),
    );
  }

  Color getColor(Status status) {
    switch (status) {
      case Status.New:
        return Color.fromARGB(255, 177, 133, 0);
      case Status.Validated:
        return Colors.blue;
      case Status.Shipped:
        return Color.fromARGB(255, 192, 86, 15);
      case Status.Deliverd:
        return Colors.green;
      case Status.Canceled:
        return Colors.redAccent;

      default:
        return Color.fromARGB(255, 177, 133, 0);
    }
  }

  IconData getIconData(Status status) {
    switch (status) {
      case Status.New:
        return Icons.timelapse;
      case Status.Validated:
        return Icons.done;
      case Status.Shipped:
        return Icons.fire_truck_outlined;
      case Status.Deliverd:
        return Icons.done_all_outlined;
      case Status.Canceled:
        return Icons.cancel;

      default:
        return Icons.timelapse;
    }
  }

  Widget ticketDetailsWidget(
    String firstTitle,
    String firstDesc,
    String secondTitle,
    String secondDesc,
    String thirdTitle,
    String thirdDesc,
    String fourthTitle,
    String fourthDesc,
  ) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                firstTitle,
                style: const TextStyle(color: Colors.grey),
              ),
              8.verticalSpace,
              Text(
                secondTitle,
                style: const TextStyle(color: Colors.grey),
              ),
              8.verticalSpace,
              Text(
                thirdTitle,
                style: const TextStyle(color: Colors.grey),
              ),
              8.verticalSpace,
              Text(
                fourthTitle,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: Get.width * 0.3,
                child: Text(
                  firstDesc,
                  style: const TextStyle(color: Colors.black),
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ),
              8.verticalSpace,
              Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
              8.verticalSpace,
              Text(
                thirdDesc,
                style: const TextStyle(color: Colors.black),
              ),
              8.verticalSpace,
              Text(
                fourthDesc,
                style: const TextStyle(color: Colors.black),
              )
            ],
          ),
        ],
      ),
    );
  }
}
