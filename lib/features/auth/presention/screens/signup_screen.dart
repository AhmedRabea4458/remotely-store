import 'package:flutter/cupertino.dart';
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
import '../widgets/phone_text_field.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
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
                      Gap(size.height * 0.18),

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

                      Gap(size.height * 0.05),

                      CustomSocialButton(
                        text: "Sign Up with Google",
                        assetIcon: AppAssets.google,
                        onPressed: () {},
                      ),

                      const Gap(16),

                      CustomSocialButton(
                        text: "Sign Up with Facebook",
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
                        label: "Phone number",
                        field: PhoneTextField(
                          controller: phoneController,
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
                        text: "Sign Up",
                        onPressed: () {},
                      ),

                      const Spacer(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: AppTextStyles.body.copyWith(
                              color: AppColors.grayDeeper,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.push('/login');
                            },
                            child: Text(
                              "Login",
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
