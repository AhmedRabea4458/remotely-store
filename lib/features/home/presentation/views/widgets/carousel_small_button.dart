import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';

class CarouselSmallButton extends StatelessWidget {
  const CarouselSmallButton({
    super.key,
    required this.currentPage,
    required this.index,
    required this.imagePath,
  });

  final int currentPage;
  final int index;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 67,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(60),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color:
              currentPage == index ? AppColors.secondary : Colors.transparent,
        ),
      ),
      child: Image.asset(imagePath),
    );
  }
}
