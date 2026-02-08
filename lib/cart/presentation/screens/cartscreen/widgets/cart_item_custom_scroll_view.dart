import 'package:flutter/material.dart';

import 'package:remotely_store/cart/presentation/cubit/cart_cubit.dart';
import 'package:remotely_store/cart/presentation/screens/cartscreen/widgets/cart_item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemCustomScrollView extends StatelessWidget {
  const CartItemCustomScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {
            final cubit = BlocProvider.of<CartCubit>(context);
            if (state is CartError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message, maxLines: 2)),
              );
            } else if (state is CartItemDeleted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  elevation: 0,

                  duration: Duration(seconds: 2),

                  content: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffeaf3ec),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff2b813a),
                          blurRadius: 0,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle_rounded,
                          color: Color(0xff2b813a),
                          size: 35,
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            maxLines: 2,
                            "تم حذف ${state.deletedItem.nameProduct}",
                            style: TextStyle(
                              color: Color(0xff2b813a),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,

                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color(
                                0xff2b813a,
                              ).withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                            ),
                            child: Text(
                              'استرجاع',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 2, 2, 2),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            onPressed: () {
                              cubit.addToList(state.deletedItem);
                              ScaffoldMessenger.of(
                                context,
                              ).hideCurrentSnackBar();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            final products =
                BlocProvider.of<CartCubit>(context).listProductCart;

            if (products.isEmpty) {
              return SliverToBoxAdapter(
                child: const Center(child: Text("Your cart is empty")),
              );
            }

            return SliverList.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return CartItemWidget(product: product);
              },
            );

            // return const Center(child: CircularProgressIndicator());
          },
        ),
      ],
    );
  }
}
