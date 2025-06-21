import 'package:meta/meta.dart';

import 'package:acdemy/Feature/Auth/Data/repos/repo.dart';
import 'package:acdemy/core/helper/Errors/Exception.dart';
import 'package:bloc/bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({required this.authRepo})
      : super(ForgetPasswordInitial());
  final AuthRepo authRepo;

  Future<void> Sendotp({required String email}) async {
    emit(ForgetPasswordLoading());
    try {
      String result = await authRepo.Sendotp(email: email);
      emit(ForgetPasswordSuccess(message: result));
    } on ServerException catch (e) {
      emit(ForgetPasswordFailure(error_message: e.errMessage));
    }
  }

  Future<void> verifyotp({required String otp}) async {
    emit(CodeVerifecationLoading());
    try {
      String result = await authRepo.verifyotp(otp: otp);
      emit(CodeVerifecationSuccess(message: result));
    } on ServerException catch (e) {
      emit(CodeVerifecationFailure(error_message: e.errMessage));
    }
  }

  Future<void> resetPassword({required String password}) async {
    emit(ResetPasswordLoading());
    try {
      String result = await authRepo.resetpassword(password: password);
      emit(ResetPasswordSuccess(message: result));
    } on ServerException catch (e) {
      emit(ResetPasswordFailure(error_message: e.errMessage));
    }
  }
  void resetState() {
    emit(ForgetPasswordInitial());
  }
}
