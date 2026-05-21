
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';

import '../../data/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteShade,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        children: [

          /// PRODUCT IMAGE
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
              bottom: 80,
            ),
            child: Center(
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
              ),
            ),
          ),

          /// FAVORITE ICON
          Positioned(
            top: 16,
            right: 16,
            child: Container(
              height: 34,
              width: 34,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child:  Icon(
                CupertinoIcons.heart_fill,
                size: 16,
                color: AppColors.primary,
              ),
            ),
          ),

          /// INFO BOX
          Positioned(
            bottom: 10,
            left: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    product.title,
                    style: AppTextStyles.subHeadline.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const Gap(2),

                  Text(
                    "USD ${product.price}",
                    style: AppTextStyles.subTitle.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.secondary,
                    ),
                  ),

                  const Gap(5),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          product.rating.toString(),
                          style:  AppTextStyles.subTitle.copyWith(
                            color: AppColors.grayDeeper,
                          ),
                        ),
                        const Gap( 4),
                        const Icon(
                          Icons.star,
                          size: 14,
                          color: Color(0xFFF2C94C),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
