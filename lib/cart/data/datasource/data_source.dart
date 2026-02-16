import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:remotely_store/cart/data/models/product_cart_model.dart';
import 'package:remotely_store/core/errors/firebase_errors.dart';

class DataSource {
  Future<void> addToCart(String userId, ProductCart product) async {
    try {
      await FirebaseFirestore.instance
          .collection("user")
          .doc(userId)
          .collection("cart")
          .add(product.toMap());
    } catch (e) {
      throw CartExceptionToFirebase(
        " ${e.hashCode} Failed to add cart in Firestore",
      );
    }
  }

  Future<bool> isexixt(ProductCart product, String userId) async {
    List<ProductCart> list = await getCartItems(userId);
    return list.any((element) => element == product);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> _getCartSnapshot(
    String userId,
  ) async {
    final cartCollection = _firestore
        .collection("user")
        .doc(userId)
        .collection("cart");

    return await cartCollection.get();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<ProductCart>> getCartItems(String userId) async {
    final cartSnapshot = await _getCartSnapshot(userId);

    List<ProductCart> list =
        cartSnapshot.docs
            .map((doc) => ProductCart.fromMap(doc.data()))
            .toList();

    return list;
  }

  Future<void> clearCart(String userId) async {
    final cartSnapshot = await _getCartSnapshot(userId);

    for (var doc in cartSnapshot.docs) {
      await doc.reference.delete();
    }
  }

  Future<void> updateToCart(
    List<ProductCart> listProduct,
    String userId,
  ) async {
    try {
      await clearCart(userId);
      for (var product in listProduct) {
        await addToCart(userId, product);
      }
    } on CartExceptionToFirebase catch (e) {
    } catch (e) {
      throw CartExceptionToFirebase(
        " ${e.hashCode} Failed to update cart in Firestore",
      );
    }
  }
}
