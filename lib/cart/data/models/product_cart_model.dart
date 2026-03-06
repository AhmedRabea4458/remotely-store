class ProductCart  {
  final int id;
  final String nameProduct;
  final double priceOneProduct;
  final String image;
  int quantityProduct;

  ProductCart({
    required this.id,
    required this.nameProduct,
    required this.priceOneProduct,
    required this.quantityProduct,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nameProduct": nameProduct,
      "priceOneProduct": priceOneProduct,
      "quantityProduct": quantityProduct,
      "image": image,
    };
  }

  /// إنشاء object من Firestore
  factory ProductCart.fromMap(Map<String, dynamic> map) {
    return ProductCart(
      id: map["id"] ?? 0,
      nameProduct: map["nameProduct"] ?? "",
      priceOneProduct: (map["priceOneProduct"] ?? 0).toDouble(),
      quantityProduct: map["quantityProduct"] ?? 0,
      image: map["image"] ?? "",
    );
  }

  /// لتعديل الكمية بسهولة
  ProductCart copyWith({int? quantityProduct}) {
    return ProductCart(
      id: id,
      nameProduct: nameProduct,
      priceOneProduct: priceOneProduct,
      quantityProduct: quantityProduct ?? this.quantityProduct,
      image: image,
    );
  }
}
