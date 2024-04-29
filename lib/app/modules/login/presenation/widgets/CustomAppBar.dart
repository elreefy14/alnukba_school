import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getx_skeleton/utils/image_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(125.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF39499C),
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  ImageConstant.imgBackArrow,
                  height: 25.0.h,
                  width: 25.0.w,
                  color: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              'تسجيل دخول',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontFamily: 'Montserrat-Arabic',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
      elevation: 0.0, // remove shadow
    );
  }
}
