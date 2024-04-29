// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:getx_skeleton/app/modules/login/presenation/widgets/admin_section.dart';
// import 'package:getx_skeleton/config/translations/strings_enum.dart';
// import 'package:getx_skeleton/utils/image_constant.dart';

// class RowIconSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       padding: EdgeInsets.symmetric(horizontal: 100.h),
//       //decoration: AppDecoration.outlineBlack,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(
//                 top: 3.h,
//                 right: 12.w,
//                 bottom: 1.h,
//               ),
//               child: AdminSection(
//                 icon: ImageConstant.imgIcons8Management,
//                 text: Strings.management.tr
//               ),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(
//                 left: 12.h,
//                 bottom: 1.h,
//               ),
//               child: AdminSection(
//                 icon: ImageConstant.imgIcons8SecurityConfiguration,
//                 text: Strings.admin.tr,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.alignment,
    this.width,
    this.scrollPadding,
    this.controller,
    this.focusNode,
    this.autofocus,
    this.textStyle,
    this.obscureText,
    this.textInputAction,
    this.textInputType,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.filled,
    this.validator})
     : super(key: key);

  final Alignment? alignment;
  final double? width;
  final EdgeInsets? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: textFormFieldWidget(context))
        : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => SizedBox(
        width: width,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          autofocus: autofocus ?? false,
          style: textStyle,
          obscureText: obscureText ?? false,
          textInputAction: textInputAction,
          keyboardType: textInputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle,
            prefix: prefix,
            prefixIconConstraints: prefixConstraints,
            suffix: suffix,
            suffixIconConstraints: suffixConstraints,
            contentPadding: contentPadding,
            border: borderDecoration,
            filled: filled ?? true,
            fillColor: fillColor,
          ),
          validator: validator,
        ),
      );
}
