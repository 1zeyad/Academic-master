import 'dart:developer';

import 'package:acdemy/core/helper/Errors/Exception.dart';
import 'package:acdemy/core/helper/Services/Api_Services.dart';
import 'package:acdemy/core/helper/Services/Interceptors.dart';
import 'package:acdemy/core/helper/end_points/Api_endpoints.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiService {
  final Dio dio;

  DioConsumer({required this.dio}) {
  
     dio.options.baseUrl =ApiEndpoints.baseUrl;     

    dio.interceptors.add(ApiInterceptor());
   
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  @override
  Future delete(String url, {String? token, Object? data, Map<String, dynamic>? queryparms}) async {
    try {
      final response = await dio.delete(url, data: data, queryParameters: queryparms);
      return response.data;
    } on DioException catch (e) {
      log("DioException in DELETE: ${e.message}");
     HandleException(e);
    }
  }

  @override
  Future get(String url, {String? token, Object? data, Map<String, dynamic>? queryparms}) async {
    try {
      final response = await dio.get(url, queryParameters: queryparms);
      return response.data;
    } on DioException catch (e) {
     
     HandleException(e);
    }
  }

  @override
  Future patch(String url, {String? token, Object? data, Map<String, dynamic>? queryparms}) async {
    try {
      final response = await dio.patch(url, data: data, queryParameters: queryparms);
      return response.data;
    } on DioException catch (e) {
      log("DioException in PATCH: ${e.message}");
     HandleException(e);
    }
  }

  @override
  Future post(String url, {String? token, Object? data, Map<String, dynamic>? queryparms}) async {
    try {
      log("Executing POST request: $url");

      var  response = await dio.post(url, data: data, queryParameters: queryparms);
       log("Executing POST request: $url");
      return response.data;
    } on DioException catch (e) {
      log("DioException2222222 in POST: ${e.message}");
       HandleException(e);
    
    } 
    catch (e) {
      log("Unexpected error in POST: ${e.toString()}");
      throw ServerException(errMessage: "something went wrong");
    }
  }

  @override
  Future put(String url, {String? token, Object? data, Map<String, dynamic>? queryparms}) async {
    try {
      final response = await dio.put(url, data: data, queryParameters: queryparms);
      return response.data;
    } on DioException catch (e) {
      log("DioException in PUT: ${e.message}");
      HandleException(e);
    }
  }
}
