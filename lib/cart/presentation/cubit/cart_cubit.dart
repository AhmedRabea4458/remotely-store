import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:remotely_store/cart/data/models/product_cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  double _shippingCost = 0;
  double subTotal = 0;
  final List<ProductCart> listProductCart = [
    ProductCart(
      id: 1,
      nameProduct: "Funiture Manila Adjustable Office Chair",
      image:
          "https://rutoofficefurniture.com/wp-content/uploads/2023/03/RC-301-H.jpg",
      quantityProduct: 1,
      pirceOneProduct: 87.00,
    ),

    ProductCart(
      id: 2,
      nameProduct: "JBL Link Music Wifi Speaker",
      pirceOneProduct: 69,
      quantityProduct: 1,
      image: "https://m.media-amazon.com/images/I/51OlNk4di0L._AC_.jpg",
    ),
    ProductCart(
      id: 3,
      nameProduct: "Logitech MX Master 2S Wireless Mouse",
      pirceOneProduct: 92,
      image: "https://m.media-amazon.com/images/I/61ni3t1ryQL._AC_SL1500_.jpg",
      quantityProduct: 1,
    ),
    ProductCart(
      id: 4,
      nameProduct: "Funiture Manila Adjustable Office Chair",
      image:
          "https://rutoofficefurniture.com/wp-content/uploads/2023/03/RC-301-H.jpg",
      quantityProduct: 1,
      pirceOneProduct: 87.00,
    ),
    ProductCart(
      id: 5,
      nameProduct: "JBL Link Music Wifi Speaker",
      pirceOneProduct: 69,
      quantityProduct: 1,
      image: "https://m.media-amazon.com/images/I/51OlNk4di0L._AC_.jpg",
    ),
    ProductCart(
      id: 6,
      nameProduct: "Logitech MX Master 2S Wireless Mouse",
      pirceOneProduct: 92,
      image: "https://m.media-amazon.com/images/I/61ni3t1ryQL._AC_SL1500_.jpg",
      quantityProduct: 1,
    ),
  ];
  removeProduct(ProductCart product) {
    try {
      listProductCart.removeWhere((test) => test.id == product.id);
      emit(CartItemDeleted(products: listProductCart, deletedItem: product));
    } catch (e) {
      emit(CartError(message: "Failed to remove product: $e"));
    }
  }

  decreaseQuantity(ProductCart product) {
    try {
      product.quantityProduct -= 1;

      if (product.quantityProduct == 0) {
        product.quantityProduct += 1;
        removeProduct(product);

        return;
      }

      emit(CartUpdated());
    } catch (e) {
      emit(CartError(message: "Failed to decrease product: $e"));
    }
  }

  increaseQuantity(ProductCart product) {
    try {
      product.quantityProduct += 1;
      emit(CartUpdated());
    } catch (e) {
      emit(CartError(message: "Failed to decrease product: $e"));
    }
  }

  addToList(ProductCart product) {
    listProductCart.add(product);
    emit(CartUpdated());
  }

  double get costSubtotal {
    double total = 0;
    listProductCart.forEach((action) {
      total += action.quantityProduct * action.pirceOneProduct;
    });
    return total;
  }

  double get costTotal {
    subTotal = costSubtotal;

    return subTotal + _shippingCost;
  }

  set setShippingCost(double cost) {
    _shippingCost = cost;
  }

  double get getShippingCost {
    return _shippingCost;
  }
}
