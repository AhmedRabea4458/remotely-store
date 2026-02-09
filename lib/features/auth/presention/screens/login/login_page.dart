import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/features/auth/presention/view_model/auth_cubit.dart';
import '../../../../../core/theme/app_text_style.dart';
import '../../widgets/social_auth_section.dart';
import 'widgets/login_form.dart';
import '../signup/widgets/signup_header.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            context.go('/');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Welcome back, ${state.user.email}!')),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(size.height * 0.20),

                const LoginHeader(
                ),

                Gap(size.height * 0.04),

                const SocialAuthSection(title: 'Login with Google',
                    subtitle: 'Login with Facebook'),

                Gap(size.height * 0.03),

                LoginForm(
                  formKey: _formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  isLoading: state is AuthLoading,
                  onSubmit: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<AuthCubit>().login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                    }
                  },
                ),

                const Gap(24),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child:  Text("Forgot password?", style:AppTextStyles.body.copyWith(
                   color: AppColors.grayDeeper
                  ),
                  )
                ),
                TextButton(
                  onPressed: () {
                    context.push('/signup');
                  },
                  child:  Text("Sign Up",style:AppTextStyles.body.copyWith(
                      color: AppColors.secondary
                  ),),
                ),
              ],
            )
              ],
            ),
          );
        },
      ),
    );
  }
}

