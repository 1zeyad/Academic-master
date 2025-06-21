import 'dart:convert';
import 'dart:developer';

import 'package:acdemy/Feature/Registration/Data/Models/AvaliableCourses.dart';
import 'package:acdemy/Feature/Registration/Data/Repo/Registration_Repo.dart';

import 'package:acdemy/core/helper/Local_cache/local_cache.dart';
import 'package:acdemy/core/helper/Services/Api_Services.dart';
import 'package:acdemy/core/helper/end_points/Api_endpoints.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/helper/Errors/Exception.dart';

class RegistrationRepoImpl implements RegistrationRepo {
  @override
  final ApiService apiService;

  RegistrationRepoImpl({required this.apiService});
  Future<Either<String, List<AvaliableCourses>>> getavailableCourses() async {
    try {
      var data = await apiService.get(ApiEndpoints.availableCourses);

      String dataString = jsonEncode(data);
      log(dataString);
      CacheHelper.saveData(key: Keys.KAvailableCourses, value: dataString);
      List<AvaliableCourses> available_courses = parseData(data);
      return right(available_courses);
    } on ServerException catch (e) {
      return left(e.errMessage);
    }
  }

  @override
  Future<String> courseRegistration({required List<String> id_Courses}) async {
    try {
      var data = await apiService
          .post(ApiEndpoints.register, data: {Keys.id_Courses: id_Courses});
      String message = data["message"];
      return message;
    } on ServerException catch (e) {
      return e.errMessage;
    }
  }

  @override
  Future<Either<String, AvaliableCourses>> getCourseDetails(
      {required String id}) async {
    try {
      var data = await apiService.get("courses/$id/details");

      return right(AvaliableCourses.fromJson(data));
    } on ServerException catch (e) {
      return left(e.errMessage);
    }
  }

  @override
  Future<Either<String, List<AvaliableCourses>>> getMyCourses() async {
    try {
      var data = await apiService.get(ApiEndpoints.myCourses);
      List<AvaliableCourses> available_courses = parseData(data);
      return right(available_courses);
    } on ServerException catch (e) {
      return left(e.errMessage);
    }
  }

  @override
  Future<Either<String, List<AvaliableCourses>>>
      getMyRecommendedCourses() async {
    try {
      var data = await apiService.get(ApiEndpoints.recomendationCourses);
      List<AvaliableCourses> RecommendedCourses = parseData(data);
      return right(RecommendedCourses);
    } on ServerException catch (e) {
      return left(e.errMessage);
    }
  }
  
  @override
  Future<bool> getRegistrationStatus() async{
   try {
  var  data  =   await apiService.get(ApiEndpoints.registrationStatus);
  return data["isOpen"];

} on ServerException  catch (e) {
  log("error in get Registration Status ${e.errMessage}");
  return false;
  
 ;
    
}
  }
}
