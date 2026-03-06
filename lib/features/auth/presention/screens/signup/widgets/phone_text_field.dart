import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  String? Function(String?)? validator;
  PhoneTextField({super.key, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 56,
          width: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.grayLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            "+20",
            style: AppTextStyles.body.copyWith(color: AppColors.grayDeeper),
          ),
        ),

        const Gap(12),

        Expanded(
          child: SizedBox(
            height: 56,
            child: TextFormField(
              controller: controller,
              validator: validator,
              keyboardType: TextInputType.phone,
              style: AppTextStyles.body,
              decoration: InputDecoration(
                hintText: "Phone number",
                hintStyle: AppTextStyles.body.copyWith(
                  color: AppColors.grayLight,
                ),
                filled: true,
                fillColor: AppColors.grayLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
