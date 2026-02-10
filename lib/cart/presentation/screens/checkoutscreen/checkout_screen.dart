import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:remotely_store/cart/presentation/cubit/cart_cubit.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/custom_buttom_navigation_bar.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/custom_icon_button_back.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/price_row.dart';
import 'package:remotely_store/cart/presentation/widgets/header_row.dart';
import 'package:remotely_store/cart/presentation/screens/checkoutscreen/widgets/payment_method_tile.dart';
import 'package:remotely_store/cart/presentation/screens/checkoutscreen/widgets/shipping_information_card.dart';
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
              Divider(color: AppColors.black),
              BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  final cubit = BlocProvider.of<CartCubit>(context);
                  return Column(
                    spacing: 7,
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
              SizedBox(height: 10),
            ],
          ),
          textPrimaryButton: 'Checkout',
          onPressedPrimaryButton: () {
            context.push("/alldone");
          },
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomIconButtonBack(),
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeaderRow(text: "Checkout"),

                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                              child: Text(
                                "PAYMENT",
                                style: AppTextStyles.subTitle,
                              ),
                            ),

                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: listPayment.length,

                              itemBuilder: (context, index) {
                                return BlocBuilder<CartCubit, CartState>(
                                  builder: (context, state) {
                                    final cubit = BlocProvider.of<CartCubit>(
                                      context,
                                    );
                                    final item = listPayment[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 5.0,
                                      ),
                                      child: PaymentMethodTile(
                                        nameImage: item.nameImage,
                                        bankName: item.bankName,
                                        lastDigits: item.lastDigits,
                                        isSelected:
                                            cubit.getIndexisSelectedPayment ==
                                                    index
                                                ? true
                                                : false,
                                        onTap: () {
                                          cubit.setIndexisSelectedPayment =
                                              index;
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
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

List<Payment> listPayment = [
  Payment(
    nameImage: "Mastercard.png",
    bankName: "Haski Bank",
    lastDigits: "8910",
  ),
  Payment(nameImage: "Visa.png", bankName: "Abbyn Bank", lastDigits: "8910"),
];

class Payment {
  final String nameImage;
  final String bankName;
  final String lastDigits;
  Payment({
    required this.nameImage,
    required this.bankName,
    required this.lastDigits,
  });
}
