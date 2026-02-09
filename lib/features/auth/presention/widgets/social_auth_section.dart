import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_text_style.dart';
import '../view_model/auth_cubit.dart';
import 'custom_social_button.dart';

class SocialAuthSection extends StatelessWidget {
  final String title;
  final String subtitle;

  const SocialAuthSection({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSocialButton(
          text: title,
          assetIcon: AppAssets.google,
          onPressed: () {
            context.read<AuthCubit>().signInWithGoogle();

          },
        ),
        const Gap(16),
        CustomSocialButton(
          text: subtitle,
          assetIcon: AppAssets.facebook,
          onPressed: () {
            context.read<AuthCubit>().signInWithFacebook();

          },
        ),
        const Gap(16),
        const Text("OR", style: AppTextStyles.body),
      ],
    );
  }
}
