import 'dart:developer';

import 'package:acdemy/core/helper/Errors/Error_Model.dart';
import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String errMessage;

  ServerException({required this.errMessage});
}

void HandleException(DioException e) {
  if (e.response != null) {
    log("in handle exception conditions ${e.response!.data}");
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
        throw ServerException(errMessage: "SendTimeout error");
      case DioExceptionType.receiveTimeout:
        throw ServerException(errMessage: "REceiveTimeout error");
      case DioExceptionType.badCertificate:
        throw ServerException(errMessage: "BadCertificate error");
      case DioExceptionType.cancel:
        throw ServerException(errMessage: "Cancel error");
      case DioExceptionType.connectionError:
        throw ServerException(errMessage: "Connection error");
      case DioExceptionType.unknown:
        throw ServerException(errMessage: "Unknown error");
      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400:
            throw ServerException(
                errMessage: ErrorModel.fromJson(e.response!.data).message);
          case 401:
            throw ServerException(
                errMessage: ErrorModel.fromJson(e.response!.data).message);

          case 403:
          case 404:
          case 409:
          case 422:
            throw ServerException(
                errMessage: ErrorModel.fromJson(e.response!.data).message);

          default:
            throw ServerException(errMessage: "Error Bad response");
        }
    }
  } else {
    throw ServerException(errMessage: "something went wrong please try again");
  }
}
