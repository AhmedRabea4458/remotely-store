import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../widgets/custom_social_button.dart';
import '../widgets/custom_text_feild.dart';
import '../widgets/lable_feild.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.06,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(size.height * 0.20),

                      Text(
                        "HI FELLA 👋",
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.w800,
                          color: AppColors.grayDeeper,
                        ),
                      ),

                      const Gap(4),

                      Text(
                        "Welcome Back",
                        style: AppTextStyles.headline.copyWith(
                          fontSize: size.width * 0.07,
                        ),
                      ),

                      Gap(size.height * 0.05),

                      CustomSocialButton(
                        text: "Login with Google",
                        assetIcon: AppAssets.google,
                        onPressed: () {},
                      ),

                      const Gap(16),

                      CustomSocialButton(
                        text: "Login with Facebook",
                        assetIcon: AppAssets.facebook,
                        onPressed: () {},
                      ),

                      Gap(size.height * 0.03),

                      const Center(
                        child: Text("OR", style: AppTextStyles.body),
                      ),

                      Gap(size.height * 0.03),

                      LabeledField(
                        label: "Email",
                        field: CustomTextField(
                          hint: "Eg. jamesburnes@gmail.com",
                          controller: emailController,
                        ),
                      ),

                      const Gap(16),

                      LabeledField(
                        label: "Password",
                        field: CustomTextField(
                          hint: "Password",
                          controller: passwordController,
                          isPassword: true,
                        ),
                      ),

                      Gap(size.height * 0.04),

                      PrimaryButton(
                        text: "Login",
                        onPressed: () {},
                      ),

                      const Spacer(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot password?",
                              style: AppTextStyles.body.copyWith(
                                color: AppColors.grayDeeper,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.push('/signup');
                            },
                            child: Text(
                              "Sign Up",
                              style: AppTextStyles.body.copyWith(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Gap(size.height * 0.02),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

