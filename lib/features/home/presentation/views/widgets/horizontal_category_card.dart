import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';

class HorizontalCategoryCard extends StatelessWidget {
  const HorizontalCategoryCard({
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
      margin: const EdgeInsets.only(left: 21),
      height: 178,
      width: 136,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.whiteShade,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset("assets/images/test.png"),
          SizedBox(height: 12),
          Text(title, style: AppTextStyles.subHeadline),
          SizedBox(height: 4),
          Text(desc, style: AppTextStyles.subTitle),
        ],
      ),
    );
  }
}
