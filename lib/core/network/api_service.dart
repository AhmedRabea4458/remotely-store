import 'package:dio/dio.dart';

import 'api_exception.dart';
import 'dio_cleint.dart';

class ApiService {
  Dio get _dio => DioClient.instance;

  Future<dynamic> getData(String endPoint) async {
    try {
      final response = await _dio.get(endPoint);
      return response.data;
    } on DioError catch (e) {
      throw ApiException.handelError(e);
    }
  }

  Future<dynamic> postData(String endPoint, {dynamic data}) async {
    try {
      final response = await _dio.post(endPoint, data: data);
      return response.data;
    } on DioError catch (e) {
      throw ApiException.handelError(e);
    }
  }

  Future<dynamic> updateData(
      String endPoint, {
        Map<String, dynamic>? data,
      }) async {
    try {
      final response = await _dio.put(endPoint, data: data);
      return response.data;
    } on DioError catch (e) {
      throw ApiException.handelError(e);
    }
  }

  Future<dynamic> deleteData(String endPoint) async {
    try {
      final response = await _dio.delete(endPoint);
      return response.data;
    } on DioError catch (e) {
      throw ApiException.handelError(e);
    }
  }
}
