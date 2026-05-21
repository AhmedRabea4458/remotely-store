import 'package:flutter/material.dart';
import 'package:remotely_store/core/constants/app_assets.dart';
import 'package:remotely_store/core/theme/app_colors.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({super.key, this.fontColor = AppColors.lightGrey,  this.rating});
  final Color fontColor;
  final String? rating ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rating??"4.8",
          style: TextStyle(
            color: fontColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 4),
        Image.asset(AppAssets.starIcon),
      ],
    );
  }
}
