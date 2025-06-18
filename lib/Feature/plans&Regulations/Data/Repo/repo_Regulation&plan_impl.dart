// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:acdemy/Feature/plans&Regulations/Data/Models/Plan_Model.dart';
import 'package:acdemy/core/helper/Errors/Exception.dart';
import 'package:acdemy/core/helper/end_points/Api_endpoints.dart';
import 'package:dartz/dartz.dart';

import 'package:acdemy/Feature/plans&Regulations/Data/Models/Regulation_Model.dart';
import 'package:acdemy/Feature/plans&Regulations/Data/Repo/repo_Regulation&Plan.dart';
import 'package:acdemy/core/helper/Services/Api_Services.dart';

class RepoImpl4 extends Repo4 {
  @override
  final ApiService apiService;
  RepoImpl4({
    required this.apiService,
  });
  Future<Either<String, Regulation>> getmyRegulation() async {
    try {
      var response = await apiService.get(ApiEndpoints.getRegulation);

      return right(Regulation.fromJson(response));
    } on ServerException catch (e) {
      return left(e.errMessage);
    }
  }

  @override
  Future<Either<String, List<PlanModel>>> getmyPlan() async {
    try {
      var data = await apiService.get(ApiEndpoints.getmyplans);

      List<PlanModel> MyPlans = parsePlans(data);

      return right(MyPlans);
    } on ServerException catch (e) {
      return left(e.errMessage);
    }
  }
}
