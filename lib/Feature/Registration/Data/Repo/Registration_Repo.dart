import 'package:acdemy/Feature/Registration/Data/Models/AvaliableCourses.dart';
import 'package:dartz/dartz.dart';

abstract class RegistrationRepo {

  Future<Either<String,List<AvaliableCourses>>> getavailableCourses();
  Future <String> courseRegistration({ required List<String> id_Courses});

  Future<Either<String,AvaliableCourses>> getCourseDetails({required String id});

  Future<Either<String,List<AvaliableCourses>>>getMyCourses();
  Future<Either<String,List<AvaliableCourses>>>getMyRecommendedCourses();

  Future<bool>getRegistrationStatus();

}