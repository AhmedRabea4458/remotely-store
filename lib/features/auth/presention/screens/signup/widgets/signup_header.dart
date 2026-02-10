import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';




class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "HI FELLA 👋",
          style: AppTextStyles.body.copyWith(
            fontWeight: FontWeight.w800,
            color: AppColors.grayDeeper,
          ),
        ),

        const Gap(4),

        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Welcome to ",
                style: AppTextStyles.headline.copyWith(
                  fontSize: size.width * 0.07,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: "Remotely.io",
                style: AppTextStyles.headline.copyWith(
                  fontSize: size.width * 0.07,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
