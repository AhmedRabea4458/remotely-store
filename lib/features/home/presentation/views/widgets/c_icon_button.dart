import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';

class CIconButton extends StatelessWidget {
  const CIconButton({
    super.key,
    required this.imageIconPath,
    required this.onTap,
    this.bgColor,
    this.borderColor,
  });
  final Color? bgColor;
  final String imageIconPath;
  final VoidCallback onTap;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        width: 42,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor ?? Colors.transparent),
          image: DecorationImage(image: AssetImage(imageIconPath)),
        ),
      ),
    );
  }
}
