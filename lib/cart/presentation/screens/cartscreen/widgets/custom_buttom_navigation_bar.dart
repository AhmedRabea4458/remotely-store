import 'package:flutter/material.dart';
import 'package:remotely_store/cart/presentation/cubit/cart_cubit.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/price_row.dart';
import 'package:remotely_store/core/theme/app_colors.dart';

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
      height: 230,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          widget ?? SizedBox(height: 0),

          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final cubit = BlocProvider.of<CartCubit>(context);
              return Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: PriceRow(
                  title: "Total",
                  colorValue: AppColors.secondary,
                  value: cubit.costTotal,
                ),
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
