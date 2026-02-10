import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:remotely_store/core/constants/app_assets.dart';
import 'package:remotely_store/shared/widgets/custom_button.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AppAssets.onBoard,
              fit: BoxFit.cover,
            ),
          ),

          // Dark overlay for better text visibility
          Container(
            color: Colors.black.withOpacity(0.4),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               const Spacer(),
                 Text(
                  "WELCOME",
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary
                  ),
                ),
                 Gap( 8),

                 Text(
                  "Remotely.io",
                  style: AppTextStyles.body.copyWith(
                    fontSize: 42,
                    color: AppColors.white
                  ),
                ),

                 Gap(2),

                 Text(
                  "We serve you with the best gadgets for your home workspace",
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w800,
                    color: Colors.white
                  ),
                ),

                 Gap( 27),

                PrimaryButton(
                  text: "Browse Shop",
                  onPressed: () {},
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.black,
                ),

                Gap(1),

                // Login Button
                PrimaryButton(
                  text: "Log In",
                  onPressed: () {
                    context.push('/login');
                  },
                  backgroundColor: Colors.white.withOpacity(0.0),
                  textColor: Colors.white,
                ),

                 Gap( 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
