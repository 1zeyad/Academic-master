
import 'package:acdemy/Feature/Auth/Data/repos/repo.dart';

import 'package:acdemy/core/helper/Local_cache/local_cache.dart';
import 'package:acdemy/core/helper/end_points/Api_endpoints.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_login_state.dart';

class UserLoginCubit extends Cubit<UserLoginState> {
  UserLoginCubit({required this.authrepo}) : super(UserLoginInitial());
  final AuthRepo authrepo;

  Future<void> LoginUser(
      {required String email, required String password}) async {
    emit(UserLoginLoading());


  var result = await authrepo.LoginUser(email: email, password: password);
  result.fold(
        (e) =>
            emit(UserLoginFailure(error_message: e.toString())),

           (data) async {
 await CacheHelper.saveData(key: ApiEndpoints.token, value: data.token);
 await CacheHelper.saveData(key: Keys.id_User, value: data.user.id);
  emit(UserLoginSuccess());
  
});

  }

}





