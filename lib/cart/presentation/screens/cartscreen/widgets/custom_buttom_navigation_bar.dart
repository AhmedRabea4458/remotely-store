import 'package:flutter/material.dart';
import 'package:remotely_store/cart/presentation/cubit/cart_cubit.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';
import 'package:remotely_store/shared/widgets/custom_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    this.widget,
    required this.textPrimaryButton,
    required this.onPressedPrimaryButton,
  });
  final Widget? widget;
  final String textPrimaryButton;
  final void Function() onPressedPrimaryButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          widget ?? SizedBox(height: 0),

          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<CartCubit>(context);
              return PriceRow(
                title: "Total",
                colorValue: AppColors.secondary,
                value: cubit.costTotal,
              );
            },
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: textPrimaryButton,
                    onPressed: onPressedPrimaryButton,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PriceRow extends StatelessWidget {
  final String title;
  final double value;
  final Color? colorTitle;
  final Color? colorValue;
  final FontWeight? fontWeight;

  final double? fontSizeValue;
  final double? fontSizeTitle;

  const PriceRow({
    super.key,
    required this.title,
    required this.value,
    this.colorTitle,
    this.colorValue,
    this.fontWeight,
    this.fontSizeValue,
    this.fontSizeTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.headline.copyWith(
            color: colorTitle,
            fontWeight: fontWeight,
            fontSize: fontSizeTitle,
          ),
        ),
        Text(
          "\$$value",
          style: AppTextStyles.headline.copyWith(
            color: colorValue,
            fontWeight: fontWeight,
            fontSize: fontSizeValue,
          ),
        ),
      ],
    );
  }
}
