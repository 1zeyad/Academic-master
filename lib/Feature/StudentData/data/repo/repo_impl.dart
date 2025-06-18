import 'dart:convert';
import 'dart:developer';

import 'package:acdemy/Feature/StudentData/data/Model/Acdemic_Info.dart';
import 'package:acdemy/Feature/StudentData/data/Model/personal_info.dart';
import 'package:acdemy/Feature/StudentData/data/Model/term_Grades.dart';
import 'package:acdemy/Feature/StudentData/data/repo/repo.dart';
import 'package:acdemy/core/helper/Errors/Exception.dart';
import 'package:acdemy/core/helper/Local_cache/local_cache.dart';
import 'package:acdemy/core/helper/Services/Api_Services.dart';
import 'package:acdemy/core/helper/end_points/Api_endpoints.dart';
import 'package:dartz/dartz.dart';

class RepoImpl implements Repo {
  final ApiService apiService;

  RepoImpl({required this.apiService});

  @override
  Future<Either<String, PersonalInfo>> getPersonalInfo() async {
    try {
      var data = await apiService.get(ApiEndpoints.personalInfo);
      var personalInfo = PersonalInfo.fromJson(data);
      String userData = jsonEncode(data);

      CacheHelper.saveData(key: Keys.KpersonalInfo, value: userData);
      return right(personalInfo);
    } on ServerException catch (e) {
      return left(e.errMessage);
    }
  }

  @override
  Future<Either<String, AcademicInfo>> getAcademicInfo() async {
    try {
      var data = await apiService.get(ApiEndpoints.academicInfo);
      var academicInfo = AcademicInfo.fromJson(data);

      String academicInfoString = jsonEncode(data);

      CacheHelper.saveData(
          key: Keys.KacademicInfooo, value: academicInfoString);

      return right(academicInfo);
    } on ServerException catch (e) {
      return left(e.errMessage);
    }
  }

  @override
  Future<Either<String, List<TermGrades>>> getTermGrades() async {
    try {
      var data = await apiService.get(ApiEndpoints.termGrades);
      List<TermGrades> termGrades = parseSemesters(data);
      return right(termGrades);
    } on ServerException catch (e) {
      return left(e.errMessage);
    }
  }
}
