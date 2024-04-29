import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_skeleton/app/modules/login/login_controller.dart';

class CircleIconWithText extends StatelessWidget {
  final String svgUrl;
  final String text;

  const CircleIconWithText({
    Key? key,
    required this.svgUrl,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<LoginController>().selectIcon(text);
      },
      child: Obx(() {
        var isSelected = Get.find<LoginController>().selectedIcon.value == text;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: isSelected ? Colors.blue : Colors.transparent, width: 2),
              ),
              child: Center(
                child: SvgPicture.asset(
                  svgUrl,
                  height: 50.0,
                  width: 50.0,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      }),
    );
  }
}