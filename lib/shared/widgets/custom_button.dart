import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';

import '../../core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final double height;
  final double width;
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.height = 50,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(8),
        ),

        child:
            isLoading
                ? const CupertinoActivityIndicator(color: AppColors.black)
                : Text(text, style: AppTextStyles.body),
      ),
    );
  }
}
