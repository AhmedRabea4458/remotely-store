import 'package:flutter/material.dart';
import 'package:remotely_store/cart/data/models/product_cart_model.dart';
import 'package:remotely_store/cart/presentation/cubit/cart_cubit.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/cart_product_image.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/cart_product_info.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/cart_quantity_selector.dart';
import 'package:remotely_store/core/theme/app_colors.dart';
import 'package:remotely_store/core/theme/app_text_style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.product});
  final ProductCart product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        height: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.grayLight,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(7, 3, 13, 3),
              child: CartProductImage(imageUrl: product.image),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CartProductInfo(
                      name: product.nameProduct,
                      price: product.pirceOneProduct,
                    ),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        final cubit = BlocProvider.of<CartCubit>(context);
                        return Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CartQuantitySelector(
                                onAdd: () {
                                  cubit.increaseQuantity(product);
                                },
                                quantity: product.quantityProduct,
                                onRemove: () {
                                  cubit.decreaseQuantity(product);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: TextButton(
                                  onPressed: () {
                                    cubit.removeProduct(product);
                                  },

                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors.background,
                                  ),
                                  child: Text(
                                    "Remove",
                                    style: AppTextStyles.subTitle.copyWith(
                                      fontSize: 12,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
