import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remotely_store/core/constants/app_assets.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/features/home/presentation/views/widgets/c_icon_button.dart';

class CAppBar extends StatelessWidget {
  const CAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CIconButton(
          imageIconPath: AppAssets.profileIcon,
          borderColor: AppColors.lightGrey,
          onTap: () {},
        ),
        Spacer(),
        CIconButton(
          imageIconPath: AppAssets.searchIcon,
          borderColor: AppColors.lightGrey,
          onTap: () {},
        ),
        SizedBox(width: 12),
        CIconButton(
          imageIconPath: AppAssets.cartIcon,
          borderColor: AppColors.lightGrey,
          onTap: () {
            context.push('/workspace');
          },
        ),
      ],
    );
  }
}
