import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../../core/helpers/validation.dart';
import '../../../../../../shared/widgets/custom_button.dart';
import '../../../widgets/custom_text_feild.dart';
import '../../../widgets/lable_feild.dart';
import 'phone_text_field.dart';

class SignupForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;
  final bool? isLoading;
  final bool isPasswordVisible;
  final VoidCallback onTogglePassword;
  const SignupForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.onSubmit, this.isLoading, required this.isPasswordVisible, required this.onTogglePassword,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      key: formKey,
      child: Column(
        children: [
          LabeledField(
            label: "Email",
            field: CustomTextField(
              hint: "Eg. jamesburnes@gmail.com",
              controller: emailController,
              validator: (p0) => Validations.validateEmail(
                context,
                emailController.text,

              ),
            ),
          ),

          const Gap(16),

          LabeledField(
            label: "Phone number",
            field: PhoneTextField(
              controller: phoneController,
              validator: (p0) =>  Validations.validatePhoneNumber(context, phoneController.text),
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

          Gap(size.height * 0.04),

          PrimaryButton(
            text: "Sign Up",
            onPressed: onSubmit,
            isLoading: isLoading ?? false,
          ),
        ],
      ),
    );
  }
}
