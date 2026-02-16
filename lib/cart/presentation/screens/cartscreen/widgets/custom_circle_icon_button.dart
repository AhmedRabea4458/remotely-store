import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';

class CustomCircleIconButton extends StatelessWidget {
  const CustomCircleIconButton({super.key, required this.iconData, this.onTap});
  final IconData iconData;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.grayDeeper),
        ),
        child: Icon(iconData, color: AppColors.grayDeeper, size: 25),
      ),
    );
  }
}
