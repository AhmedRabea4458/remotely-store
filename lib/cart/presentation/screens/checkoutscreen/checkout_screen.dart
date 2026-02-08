import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remotely_store/cart/presentation/cubit/cart_cubit.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/custom_buttom_navigation_bar.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/custom_icon_button_back.dart';
import 'package:remotely_store/cart/presentation/screens/checkoutscreen/widgets/checkout_header_row.dart';
import 'package:remotely_store/cart/presentation/screens/checkoutscreen/widgets/payment_method_tile.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..setShippingCost = 10,
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          widget: Column(
            children: [
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  final cubit = BlocProvider.of<CartCubit>(context);
                  return Column(
                    children: [
                      PriceRow(
                        title: "Subtotal",
                        colorTitle: AppColors.grayMedium,
                        colorValue: AppColors.grayMedium,
                        value: cubit.costSubtotal,
                        fontWeight: FontWeight.w800,
                        fontSizeTitle: 15,
                        fontSizeValue: 20,
                      ),
                      PriceRow(
                        title: "Shipping cost",
                        colorTitle: AppColors.grayMedium,
                        colorValue: AppColors.grayMedium,
                        value: cubit.getShippingCost,
                        fontWeight: FontWeight.w800,
                        fontSizeTitle: 15,
                        fontSizeValue: 20,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          textPrimaryButton: 'Checkout',
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
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CheckoutHeaderRow(),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              child: Text(
                                "PAYMENT",
                                style: AppTextStyles.subTitle,
                              ),
                            ),
                            PaymentMethodTile(
                              nameImage: "Visa.png",
                              bankName: "Abbyn Bank",
                              lastDigits: "8910",
                              isSelected: true,
                            ),
                            SizedBox(height: 20),
                            PaymentMethodTile(
                              nameImage: "Mastercard.png",
                              bankName: "Haski Bank",
                              lastDigits: "8910",
                              isSelected: false,
                            ),
                            ShippingInformationCard(),
                          ],
                        ),
                      ),
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

class ShippingInformationCard extends StatelessWidget {
  const ShippingInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SHIPPING INFORMATION',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),

          Container(
            height: 140,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(Icons.location_on, color: Colors.black, size: 32),
            ),
          ),

          const SizedBox(height: 12),

          Text(
            '6391 Elgin St. Celina, Delaware 10299',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text('(480) 555-0103', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
