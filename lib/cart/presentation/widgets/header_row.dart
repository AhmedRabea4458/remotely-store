import 'package:flutter/material.dart';

import 'package:remotely_store/core/theme/app_text_style.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    super.key,
    required this.text,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  });
  final String text;
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [Text(text, style: AppTextStyles.headline)],
    );
  }
}
