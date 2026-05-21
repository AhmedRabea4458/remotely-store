import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';
import '../../core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double height;
  final double width;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderRadius;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.height = 55,
    this.width = double.infinity,
    this.backgroundColor,
    this.textColor,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isLoading;

    return GestureDetector(
      onTap: isDisabled ? null : onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: isDisabled
              ? AppColors.primary.withOpacity(0.5)
              : backgroundColor ?? AppColors.primary,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: isLoading
            ? const CupertinoActivityIndicator(
          color: AppColors.black,
        )
            : Text(
          text,
          style: AppTextStyles.body.copyWith(
            color: textColor ?? AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
