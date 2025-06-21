import 'package:acdemy/Feature/Home/Data/Repos/Repo.dart';
import 'package:acdemy/core/helper/Services/Api_Services.dart';
import 'package:acdemy/core/helper/end_points/Api_endpoints.dart';

class HomeRepoImpl  implements HomeRepo{

  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  Future<String> ChangePassword(
      {required String oldpassword, required String Newpassword}) async {

      var response = await apiService.patch(ApiEndpoints.changePassword,
          data: {Keys.oldPassword: oldpassword, Keys.newPassword: Newpassword});

        String data = response["message"];
          return  data;

    } 
}