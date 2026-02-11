import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_style.dart';

class LabeledField extends StatelessWidget {
  final String label;
  final Widget field;

  const LabeledField({
    super.key,
    required this.label,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.body.copyWith(
            color: AppColors.grayDeeper,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Gap(8),
        field,
      ],
    );
  }
}