import 'package:flutter/material.dart';

import 'package:remotely_store/cart/presentation/cubit/cart_cubit.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/cart_header_row.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/cart_item_custom_scroll_view.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/custom_buttom_navigation_bar.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/custom_icon_button_back.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          textPrimaryButton: 'Proceed to Checkout',
          onPressedPrimaryButton: () {},
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomIconButtonBack(),
                      CartHeaderRow(),
                      SizedBox(height: 20),
                      Expanded(child: CartItemCustomScrollView()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
