import 'package:acdemy/Feature/StudentData/data/Model/Acdemic_Info.dart';
import 'package:acdemy/Feature/StudentData/data/Model/personal_info.dart';
import 'package:acdemy/Feature/StudentData/data/Model/term_Grades.dart';
import 'package:dartz/dartz.dart';

abstract class Repo {
  Future<Either<String,PersonalInfo>> getPersonalInfo();

  Future<Either<String,AcademicInfo>> getAcademicInfo();

  Future<Either<String,List<TermGrades>>> getTermGrades();
}