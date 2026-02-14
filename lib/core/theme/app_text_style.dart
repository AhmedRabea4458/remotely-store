import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_fonts.dart';

class AppTextStyles {
  AppTextStyles._();
  static const TextStyle headline = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w900,
    fontSize: 21,
    color: AppColors.textPrimary,
  );

  static const TextStyle subHeadline = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w800,
    fontSize: 16,
    color: AppColors.textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle subTitle = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: AppColors.textSecondary,
  );

  static const TextStyle normal = TextStyle(
    fontFamily: AppFonts.primaryFont,
    fontSize: 16,
    color: AppColors.black,
  );
}
