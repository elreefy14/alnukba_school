import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_skeleton/config/translations/strings_enum.dart';

import '../../../data/models/product_model.dart';

class ProductCommandeItem extends StatelessWidget {
  final ProductModel product;
  const ProductCommandeItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.r),
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: 105.w,
                  height: 125.h,
                  child: Image.network(
                    product.images!.first,
                    //  height: 250.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          20.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.verticalSpace,
              SizedBox(
                width: 150.w,
                child: Text(
                  product.name!,
                  style: theme.textTheme.displayMedium,
                  overflow: TextOverflow.fade,
                ),
              ),
              10.verticalSpace,
              Text(
                '${product.promoPrice ?? product.price}DZD',
                style: theme.textTheme.displayLarge?.copyWith(
                  fontSize: 18.sp,
                ),
              ),
              5.verticalSpace,
              Text('${Strings.unite.tr} : ${product.unit ?? ""}',
                  style: theme.textTheme.bodyMedium),
              5.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('${Strings.quantity} : ${product.quantity}',
                      style: theme.textTheme.displaySmall),
                  10.horizontalSpace,
                  Text('${product.type ?? ""}',
                      style: theme.textTheme.bodyMedium),
                ],
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
