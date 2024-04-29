import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/theme/dark_theme_colors.dart';
import '../../config/theme/light_theme_colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    required this.textInputType,
    required this.obscureText,
    required this.iconData,
    required this.isTransparent,
    this.phoneValidation,
    this.onChanged,
  });
  String label;
  bool isTransparent;
  String hint;
  String? phoneValidation;
  TextEditingController controller;
  TextInputType textInputType;
  Function(String val)? onChanged;
  IconData iconData;
  bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          decoration: BoxDecoration(
              color: isTransparent
                  ? Colors.transparent
                  : LightThemeColors.backgroundColor,
              borderRadius: BorderRadius.circular(8)),
        )),
        TextField(
          obscureText: obscureText,
          onChanged: onChanged,
          controller: controller,
          keyboardType: textInputType,
          style: TextStyle(
              fontSize: 15.w,
              color: isTransparent
                  ? LightThemeColors.backgroundColor
                  : DarkThemeColors.accentColor),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
              errorText: phoneValidation,
              /*  label: Text(
                label,
                style:
                    TextStyle(fontSize: 13, color: DarkThemeColors.accentColor),
              ),*/
              suffixIcon: Icon(
                iconData,
                color: LightThemeColors.iconColor,
              ),
              hintText: label,
              hintStyle: TextStyle(
                  fontSize: 13,
                  color: DarkThemeColors.accentColor.withOpacity(0.5)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      width: 0,
                      color: LightThemeColors.primaryColor.withOpacity(0.5))),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      width: 2, color: LightThemeColors.primaryColor))),
        ),
      ],
    );
  }
}
