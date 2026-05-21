import 'package:flutter/material.dart';
import 'package:remotely_store/core/constants/app_assets.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/rate_widget.dart';

class VerticalProductCard extends StatelessWidget {
  const VerticalProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.22,
            decoration: BoxDecoration(
              color: AppColors.whiteShade,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(image: AssetImage(AppAssets.testVer)),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Smart Apple Watch SE", style: AppTextStyles.body),
              SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Hughlan Workspaces',
                    style: TextStyle(
                      color: AppColors.deepGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 16),
                  RateWidget
                    (fontColor: AppColors.grayDeeper),
                ],
              ),
              Spacer(),
              Text(
                "\$319.00",
                style: AppTextStyles.headline.apply(color: AppColors.secondary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
