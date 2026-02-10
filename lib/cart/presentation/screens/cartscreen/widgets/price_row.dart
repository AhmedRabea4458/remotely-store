import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';

class PriceRow extends StatelessWidget {
  final String title;
  final double value;
  final Color? colorTitle;
  final Color? colorValue;
  final FontWeight? fontWeight;

  final double? fontSizeValue;
  final double? fontSizeTitle;

  const PriceRow({
    super.key,
    required this.title,
    required this.value,
    this.colorTitle,
    this.colorValue,
    this.fontWeight,
    this.fontSizeValue,
    this.fontSizeTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.headline.copyWith(
            color: colorTitle,
            fontWeight: fontWeight,
            fontSize: fontSizeTitle,
          ),
        ),
        Text(
          "\$$value",
          style: AppTextStyles.headline.copyWith(
            color: colorValue,
            fontWeight: fontWeight,
            fontSize: fontSizeValue,
          ),
        ),
      ],
    );
  }
}
