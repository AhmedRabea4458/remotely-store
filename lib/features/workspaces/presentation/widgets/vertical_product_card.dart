import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../home/presentation/views/widgets/rate_widget.dart';
import '../../data/models/product.dart';

class VerticalProductCard extends StatelessWidget {
  final Product product;

  const VerticalProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 80,
                  height: 80,
                  color: const Color(0xFFF3F3F3),
                  child: Image.network(
                    product.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(
                top: -6,
                right: -6,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                      ),
                    ],
                  ),
                  child: Icon(
                    CupertinoIcons.heart_fill,
                    size: 16,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title,
                    style: AppTextStyles.body),
                const Gap(4),
                Row(
                  children: [
                    Text(
                        product.category.toString() ,
                        style:AppTextStyles.subTitle.copyWith(
                            color: AppColors.grayDeeper
                        )
                    ),
                    const SizedBox(width: 8),
                    RateWidget(
                      rating:  product.rating.toString(),
                      fontColor: AppColors.grayDeeper,
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  "\$${product.price}",
                  style: AppTextStyles.body
                      .copyWith(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
