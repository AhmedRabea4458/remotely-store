import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/shared/widgets/custom_button.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: PrimaryButton(
                height: 60,
                text: 'Add to cart',
                onPressed: () {},
              ),
            ),
            SizedBox(width: 16),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.favorite_border_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
