import 'package:flutter/material.dart';
import 'package:remotely_store/core/theme/app_colors.dart';

class CartProductImage extends StatelessWidget {
  const CartProductImage({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 94,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(imageUrl)),
      ),
    );
  }
}
