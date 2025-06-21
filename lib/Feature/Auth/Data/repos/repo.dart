import 'package:acdemy/Feature/Auth/Data/models/User_Response.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<String, UserResponse>> LoginUser({
    required String email,
    required String password,
  });

  Future<String> Sendotp({required String email});

  Future<String> verifyotp({String? email, required String otp});

   Future<String> resetpassword({String? email,String?otp ,required String password});
}
