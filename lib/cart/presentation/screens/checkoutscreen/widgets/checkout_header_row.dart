import 'package:flutter/material.dart';

import 'package:remotely_store/core/theme/app_text_style.dart';

class CheckoutHeaderRow extends StatelessWidget {
  const CheckoutHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text("Checkout", style: AppTextStyles.headline)],
    );
  }
}
