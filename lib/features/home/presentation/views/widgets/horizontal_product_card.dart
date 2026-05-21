import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/rate_widget.dart';

class HorizontalProductCard extends StatelessWidget {
  const HorizontalProductCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.desc,
  });
  final String imagePath;
  final String title;
  final String desc;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(left: 21),
      height: 178,
      width: 136,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteShade,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Image.asset("assets/images/testHor.png"),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 8),
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Text(title, style: AppTextStyles.subHeadline),
                  SizedBox(height: 4),
                  Text(
                    "\$87.00",
                    style: AppTextStyles.subHeadline.apply(
                      color: AppColors.secondary,
                    ),
                  ),
                  RateWidget(fontColor: AppColors.grayDeeper),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
