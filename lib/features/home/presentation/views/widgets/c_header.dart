import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';

class CHeader extends StatelessWidget {
  const CHeader({
    super.key,
    required this.title,
    required this.onTap,
    this.inDetailsView = false,
  });
  final String title;
  final VoidCallback onTap;
  final bool inDetailsView;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.headline.apply(
            fontSizeDelta: inDetailsView ? -9 : 0,
          ),
        ),
        Spacer(),
        inDetailsView
            ? SizedBox()
            : GestureDetector(
              onTap: onTap,
              child: Row(
                children: [
                  Text("See more", style: AppTextStyles.subTitle),
                  SizedBox(width: 4),
                  Icon(Icons.chevron_right, color: AppColors.deepGrey),
                ],
              ),
            ),
      ],
    );
  }
}
