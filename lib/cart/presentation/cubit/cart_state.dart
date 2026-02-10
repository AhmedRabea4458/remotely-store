part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartUpdated extends CartState {
  CartUpdated();
}

final class CartItemDeleted extends CartState {
  final List<ProductCart> products;
  final ProductCart deletedItem;
  CartItemDeleted({required this.products, required this.deletedItem});
}

final class CartError extends CartState {
  final String message;

  CartError({required this.message});
}

final class SetStateUI extends CartState {}
