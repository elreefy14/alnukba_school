import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/light_theme_colors.dart';
import '../../../../data/models/category_model.dart';
import '../../controllers/home_controller.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.categoryModel});

  final HomeController controller = Get.put(HomeController());
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCategory(categoryModel);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 3),
        decoration: BoxDecoration(
          color: categoryModel == controller.selctedCategory
              ? LightThemeColors.accentColor
              : Get.theme.backgroundColor,
          borderRadius: BorderRadius.circular(50.w),
          border: Border.all(color: Colors.green, width: 2),
        ),
        child: Text(
          categoryModel.name,
          style: TextStyle(
            color: categoryModel == controller.selctedCategory
                ? Colors.white
                : Get.isDarkMode
                    ? Colors.white
                    : Colors.black,
          ),
        ),
      ),
    );
  }
}
