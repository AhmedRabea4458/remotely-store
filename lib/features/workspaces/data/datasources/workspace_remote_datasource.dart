import '../models/product.dart';

abstract class WorkspaceRemoteDataSource {
  Future<List<String>> getCategories();

  Future<List<Product>> getProductsByCategory(String category);

  Future<Product> getProductById(int id);
}
