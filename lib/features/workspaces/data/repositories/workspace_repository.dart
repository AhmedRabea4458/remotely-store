import '../datasources/workspace_remote_datasource.dart';
import '../models/product.dart';

class WorkspaceRepository {
  final WorkspaceRemoteDataSource remote;

  WorkspaceRepository(this.remote);

  Future<List<String>> getCategories() =>
      remote.getCategories();

  Future<List<Product>> getProductsByCategory(String category) =>
      remote.getProductsByCategory(category);
}
