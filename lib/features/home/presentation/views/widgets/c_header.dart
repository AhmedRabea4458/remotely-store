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
    return  Row(
      children: [
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.headline.apply(
              fontSizeDelta: inDetailsView ? -9 : 0,
            ),
          ),
        ),

        if (!inDetailsView) ...[
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onTap,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "See more",
                  style: AppTextStyles.subTitle,
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.chevron_right,
                  color: AppColors.deepGrey,
                ),
              ],
            ),
          ),
        ],
      ],
    );

  }
}
