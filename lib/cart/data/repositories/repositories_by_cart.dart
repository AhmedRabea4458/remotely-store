import 'package:remotely_store/cart/data/datasource/data_source.dart';
import 'package:remotely_store/cart/data/models/product_cart_model.dart';

class RepositoriesByCart {
  DataSource dataSource = DataSource();
  addToCart(String userId, ProductCart product) {
    dataSource.addToCart(userId, product);
  }
}
