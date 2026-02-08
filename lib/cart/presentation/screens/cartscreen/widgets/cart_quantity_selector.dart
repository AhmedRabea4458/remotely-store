import 'package:flutter/material.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/custom_circle_icon_button.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';

class CartQuantitySelector extends StatelessWidget {
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const CartQuantitySelector({
    super.key,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCircleIconButton(iconData: Icons.remove, onTap: onRemove),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "$quantity",
            style: AppTextStyles.subTitle.copyWith(
              fontSize: 20,
              color: AppColors.grayMedium,
            ),
          ),
        ),
        CustomCircleIconButton(iconData: Icons.add, onTap: onAdd),
      ],
    );
  }
}
