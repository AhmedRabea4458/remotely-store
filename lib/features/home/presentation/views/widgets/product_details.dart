import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/rate_widget.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hughlan Ergonomic Adjustable Office Chair",
                      style: AppTextStyles.headline,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          "Hughlan Workspaces",
                          style: AppTextStyles.subTitle,
                        ),
                        SizedBox(width: 8),
                        RateWidget(),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 78,
                width: 78,
                color: AppColors.lightestGreen,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '\$113',
                      style: AppTextStyles.headline.apply(
                        color: AppColors.deepGreen,
                      ),
                    ),
                    Text(
                      '7% off',
                      style: AppTextStyles.subTitle.apply(
                        color: AppColors.deepGreen,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Hughlan ergonomic chair adopts an ergonomic design.This ergonomic desk chair can help you ease fatigue, reduce occupational disesase and let you develop good sitting posture habits',
            style: AppTextStyles.normal,
          ),
        ),
      ],
    );
  }
}
