part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;

  ForgetPasswordSuccess({required this.message});
}

final class ForgetPasswordFailure extends ForgetPasswordState {
  final String error_message;

  ForgetPasswordFailure({required this.error_message});
}


final class CodeVerifecationLoading extends ForgetPasswordState {}

final class  CodeVerifecationSuccess extends ForgetPasswordState {
  final String message;

   CodeVerifecationSuccess({required this.message});
}

final class  CodeVerifecationFailure extends ForgetPasswordState {
  final String error_message;

   CodeVerifecationFailure({required this.error_message});
}



final class ResetPasswordLoading extends ForgetPasswordState {}

final class  ResetPasswordSuccess extends ForgetPasswordState {
  final String message;

   ResetPasswordSuccess({required this.message});
}

final class  ResetPasswordFailure extends ForgetPasswordState {
  final String error_message;

   ResetPasswordFailure({required this.error_message});
}
