import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:remotely_store/core/theme/app_colors.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_text_style.dart';

class FeaturedWorkspaceCard extends StatelessWidget {
  const FeaturedWorkspaceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(32),
      child: SizedBox(
        height: 181,
        child: Stack(
          children: [

            // Background Gradient
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFF000202),
                    Color(0xFF232323),
                    Color(0xFF1F1F1F),
                  ],
                ),
              ),
            ),

            // Image on right
            Positioned(
              right: 0,
              bottom: 0,
              top: 0,
              child: Image.asset(
                AppAssets.featuredWorkspace,
                fit: BoxFit.contain,
              ),
            ),

            // Text content
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FEATURED WORKSPACE",
                    style: AppTextStyles.subTitle.copyWith(
                      color: Colors.white70,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Professional Gaming\nAccessories",
                    style: AppTextStyles.headline.copyWith(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "View space →",
                    style: AppTextStyles.subTitle.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
