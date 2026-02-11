import 'package:flutter/material.dart';
import 'package:remotely_store/core/constants/app_assets.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/popular_card.dart';

class PopularSection extends StatelessWidget {
  const PopularSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Popular now", style: AppTextStyles.headline),
              SizedBox(height: 16),
              PopularCard(),
              SizedBox(height: 16),
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(right: 12, top: 12),
            child: Image.asset(AppAssets.chair1, height: 246, width: 129),
          ),
        ),
      ],
    );
  }
}
