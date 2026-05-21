
import 'package:dio/dio.dart';
import 'package:remotely_store/features/workspaces/data/datasources/workspace_remote_datasource.dart';

import '../models/product.dart';

import 'package:dio/dio.dart';
import '../models/product.dart';
import 'workspace_remote_datasource.dart';

class WorkspaceRemoteDataSourceImpl
    implements WorkspaceRemoteDataSource {

  final Dio dio;

  WorkspaceRemoteDataSourceImpl(this.dio);

  @override
  Future<List<String>> getCategories() async {
    try {
      final response = await dio.get('/products/category-list');

      return List<String>.from(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      final response =
      await dio.get('/products/category/$category');

      final List data = response.data['products'];

      return data
          .map((json) => Product.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Product> getProductById(int id) async {
    try {
      final response = await dio.get('/products/$id');

      return Product.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

