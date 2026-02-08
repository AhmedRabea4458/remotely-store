import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';

class CartProductInfo extends StatelessWidget {
  final String name;
  final double price;

  const CartProductInfo({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.body,
        ),
        const SizedBox(height: 4),
        Text(
          "USD $price",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.subTitle.copyWith(
            color: AppColors.secondary,

            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
