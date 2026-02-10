import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:remotely_store/features/auth/presention/widgets/social_auth_section.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_style.dart';
import '../../view_model/auth_cubit.dart';

import 'widgets/signup_form.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            context.go('/');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('scuccessfully registered')),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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

                  SocialAuthSection(
                    title: 'Sign Up with Google',
                    subtitle: 'Sign Up with Facebook',
                  ),
                  Gap(size.height * 0.03),

                  SignupForm(
                    formKey: _formKey,
                    isLoading: state is AuthLoading,
                    emailController: emailController,
                    phoneController: phoneController,
                    passwordController: passwordController,
                    isPasswordVisible: isPasswordVisible,
                    onTogglePassword: (){
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    onSubmit: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().register(
                          email: emailController.text.trim(),
                          phone: phoneController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                      }
                    },
                  ),

                  const Gap(24),

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
          );
        },

    );
  }
}
