import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/helpers/validation.dart';
import '../../../../../../shared/widgets/custom_button.dart';
import '../../../widgets/custom_text_feild.dart';
import '../../../widgets/lable_feild.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isLoading;
  final VoidCallback onSubmit;
  final bool isPasswordVisible;
  final VoidCallback onTogglePassword;
  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isLoading,
    required this.onSubmit, required this.isPasswordVisible, required this.onTogglePassword,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          LabeledField(
            label: "Email",
            field: CustomTextField(
              hint: "Eg. jamesburnes@gmail.com",
              controller: emailController,
              validator:
                  (p0) => Validations.validateEmail(
                context,
                emailController.text,
              ),
            ),
          ),
          const Gap(16),
          LabeledField(
            label: "Password",
            field: CustomTextField(
              hint: "Password",
              controller: passwordController,
              isPasswordVisible: isPasswordVisible,
              onTogglePassword: onTogglePassword,
              isPassword: true,
              validator: (p0) => Validations.validatePassword(
            context,
            passwordController.text,
          ),
            ),
          ),
          const Gap(24),
          PrimaryButton(
            text: "Login",
            onPressed: onSubmit,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }
}
