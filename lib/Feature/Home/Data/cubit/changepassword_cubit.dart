import 'package:acdemy/Feature/Home/Data/Repos/Repo.dart';
import 'package:acdemy/core/helper/Errors/Exception.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changepassword_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required this.homeRepo})
      : super(ChangePasswordInitial());
  final HomeRepo homeRepo;
  Future<void> changePassword(
      {required String oldpassword, required String Newpassword}) async {
    emit(ChangePasswordLoading());
    try {
      String result = await homeRepo.ChangePassword(
          oldpassword: oldpassword, Newpassword: Newpassword);
      emit(ChangePasswordSuccess(message: result));
    } on ServerException catch (e) {
      emit(ChangePasswordFailure(errorMessage: e.errMessage));
    }
  }
}
