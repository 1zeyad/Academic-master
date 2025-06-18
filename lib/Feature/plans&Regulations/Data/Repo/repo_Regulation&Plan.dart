import 'package:acdemy/Feature/plans&Regulations/Data/Models/Plan_Model.dart';
import 'package:acdemy/Feature/plans&Regulations/Data/Models/Regulation_Model.dart';
import 'package:dartz/dartz.dart';

abstract  class Repo4 {

  Future<Either<String,Regulation>>  getmyRegulation();

   Future<Either<String, List<PlanModel>>>  getmyPlan();
  

}
