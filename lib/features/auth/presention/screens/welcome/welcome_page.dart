import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:remotely_store/core/constants/app_assets.dart';
import 'package:remotely_store/shared/widgets/custom_button.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_style.dart';
import '../../view_model/auth_cubit.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Guest) {
          context.go('/');
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Image.asset(
                AppAssets.onBoard,
                fit: BoxFit.cover,
              ),
            ),

            // Dark overlay
            Container(
              width: size.width,
              height: size.height,
              color: Colors.black.withOpacity(0.4),
            ),

            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),

                    Text(
                      "WELCOME",
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                        fontSize: size.width * 0.045,
                      ),
                    ),

                    Gap(size.height * 0.01),

                    Text(
                      "Remotely.io",
                      style: AppTextStyles.body.copyWith(
                        fontSize: size.width * 0.10,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Gap(size.height * 0.005),

                    Text(
                      "We serve you with the best gadgets for your home workspace",
                      style: AppTextStyles.body.copyWith(
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        fontSize: size.width * 0.035,
                      ),
                    ),

                    Gap(size.height * 0.04),

                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        text: "Browse Shop",
                        onPressed: () {
                          context.read<AuthCubit>().continueAsGuest();
                        },
                        backgroundColor: AppColors.primary,
                        textColor: AppColors.black,
                      ),
                    ),

                    Gap(size.height * 0.02),

                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        text: "Log In",
                        onPressed: () {
                          context.push('/login');
                        },
                        backgroundColor:
                        Colors.white.withOpacity(0.0),
                        textColor: Colors.white,
                      ),
                    ),

                    Gap(size.height * 0.06),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
