import 'package:acdemy/Feature/AcademicAlert&Tranning/Data/Repo/WarningsRepo.dart';
import 'package:acdemy/Feature/AcademicAlert&Tranning/Data/models/WarningModel.dart';
import 'package:acdemy/core/helper/Services/Api_Services.dart';
import 'package:acdemy/core/helper/end_points/Api_endpoints.dart';

class WarningsrepoImpl  implements Warningsrepo{
  @override
   final ApiService apiServices;

  WarningsrepoImpl({required this.apiServices});
  Future<List<WarningModel>> getWarnings()async {
    var  response =await apiServices.get(ApiEndpoints.Warnings);
    List<WarningModel> warningsList = WarningModel.parseWarningsModel(response);
    return warningsList;
  }


}