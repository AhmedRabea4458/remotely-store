class ProductCart {
  final int id;
  final String nameProduct;
  final double pirceOneProduct;
  final String image;
  int quantityProduct;
  ProductCart({
    required this.nameProduct,
    required this.pirceOneProduct,
    required this.quantityProduct,
    required this.image,
    required this.id,
  });
}
