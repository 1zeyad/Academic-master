import 'dart:developer';

import 'package:acdemy/Feature/Auth/Data/models/User_Response.dart';
import 'package:acdemy/Feature/Auth/Data/repos/repo.dart';

import 'package:acdemy/core/helper/Errors/Exception.dart';
import 'package:acdemy/core/helper/Local_cache/local_cache.dart';
import 'package:acdemy/core/helper/Services/Api_Services.dart';
import 'package:acdemy/core/helper/end_points/Api_endpoints.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiServices;

  AuthRepoImpl({required this.apiServices});

  @override
  Future<Either<String, UserResponse>> LoginUser(
      {required String email, required String password}) async {
    try {
      log("in repo iml LoginUser");
      var response = await apiServices.post(ApiEndpoints.login,
          data: {"email": email, "password": password});
      var data = UserResponse.fromJson(response);
      return right(data);
    } on ServerException catch (e) {
      log("in repo iml LoginUser${e.toString()}");
      return left(e.errMessage);
    }
  }

  @override
  Future<String> Sendotp({required String email}) async {
    var response =
        await apiServices.post(ApiEndpoints.sendotp, data: {"email": email});
    return response["message"];
  }

  @override
  Future<String> verifyotp({String? email, required String otp}) async {
    var response = await apiServices.post(ApiEndpoints.verifyotp,
        data: {"email": Keys.email_forgetPassword, "otp": otp});
    return response["message"];
  }

  @override
  Future<String> resetpassword(
      {String? email, String? otp, required String password}) async {
    var response = await apiServices.post(ApiEndpoints.resetPassword, data: {
      Keys.email: Keys.email_forgetPassword,
      Keys.otp: CacheHelper.getData(key: Keys.otp),
      Keys.password: password
    });
    return response["message"];
  }
}
