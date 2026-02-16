import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';

class CardDot extends StatelessWidget {
  const CardDot({
    super.key,
    required this.radius,
    required this.backgroundColor,
  });
  final double radius;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.grayDeeper, width: 1.5),
        ),
        child: CircleAvatar(radius: radius, backgroundColor: backgroundColor),
      ),
    );
  }
}
