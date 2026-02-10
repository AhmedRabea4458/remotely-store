import 'package:flutter/material.dart';

import 'package:remotely_store/cart/presentation/cubit/cart_cubit.dart';
import 'package:remotely_store/cart/presentation/widgets/header_row.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartHeaderRow extends StatelessWidget {
  const CartHeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HeaderRow(text: "Your Cart"),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final cubit = BlocProvider.of<CartCubit>(context);
            return Text(
              "${cubit.listProductCart.length} Items",
              style: AppTextStyles.subTitle.copyWith(
                fontWeight: FontWeight.w800,
              ),
            );
          },
        ),
      ],
    );
  }
}
