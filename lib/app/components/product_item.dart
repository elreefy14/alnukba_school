import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../data/models/product_model.dart';
import '../routes/app_pages.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return GestureDetector(
      onTap: () =>
          Get.toNamed(Routes.PRODUCT_DETAILS, arguments: {"product": product}),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFEDF1FA),
                  borderRadius: BorderRadius.circular(25.r),
                ),
              ),
              SizedBox(
                width: double.infinity,
                // height: 200.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: Image.network(
                    product.images!.first,
                    height: 200.h,
                    fit: BoxFit.cover,
                  ).animate().slideX(
                        duration: const Duration(milliseconds: 200),
                        begin: 1,
                        curve: Curves.easeInSine,
                      ),
                ),
              ),
              /* Positioned(
                left: 15.w,
                bottom: 20.h,
                child: GetBuilder<BaseController>(
                  id: 'FavoriteButton',
                  builder: (controller) => GestureDetector(
                    onTap: () => controller.onFavoriteButtonPressed(
                        productId: product.id!),
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundColor: Colors.white,
                      child: SvgPicture.asset(
                        product.isFavorite!
                            ? Constants.favFilledIcon
                            : Constants.favOutlinedIcon,
                        color:
                            product.isFavorite! ? null : theme.primaryColor,
                      ),
                    ),
                  ),
                ),
              ).animate().fade(),
            */
            ],
          ),
          10.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(product.name!,
                        style: theme.textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600))
                    .animate()
                    .fade()
                    .slideY(
                      duration: const Duration(milliseconds: 200),
                      begin: 1,
                      curve: Curves.easeInSine,
                    ),
              ),
              //Spacer(),
              Text(product.type ?? "", style: theme.textTheme.bodyMedium)
                  .animate()
                  .fade()
                  .slideY(
                    duration: const Duration(milliseconds: 200),
                    begin: 1,
                    curve: Curves.easeInSine,
                  ),
            ],
          ),
          5.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              product.promoPrice != null
                  ? promoPrice(theme)
                  : normalPrice(theme),
              Text(product.unit ?? "", style: theme.textTheme.bodyMedium)
                  .animate()
                  .fade()
                  .slideY(
                    duration: const Duration(milliseconds: 200),
                    begin: 1,
                    curve: Curves.easeInSine,
                  ),
            ],
          ),
        ],
      ),
    );
  }

  Widget promoPrice(ThemeData theme) {
    return Row(
      children: [
        Text('DZ ${product.promoPrice}', style: theme.textTheme.displaySmall)
            .animate()
            .fade()
            .slideY(
              duration: const Duration(milliseconds: 200),
              begin: 2,
              curve: Curves.easeInSine,
            ),
        //  Spacer(),
        product.promoPrice == null
            ? Container()
            : Text(
                ' DZ ${product.price.toString()}',
                style: theme.textTheme.bodyMedium!
                    .copyWith(decoration: TextDecoration.lineThrough),
              ).animate().fade().slideY(
                  duration: const Duration(milliseconds: 200),
                  begin: 1,
                  curve: Curves.easeInSine,
                ),
      ],
    );
  }

  Widget normalPrice(ThemeData theme) {
    return Row(
      children: [
        Text('DZ ${product.price}', style: theme.textTheme.displaySmall)
            .animate()
            .fade()
            .slideY(
              duration: const Duration(milliseconds: 200),
              begin: 2,
              curve: Curves.easeInSine,
            ),
      ],
    );
  }
}
