part of 'user_login_cubit.dart';

@immutable
sealed class UserLoginState {}

final class UserLoginInitial extends UserLoginState {}

final class UserLoginLoading extends UserLoginState {}

final class UserLoginFailure extends UserLoginState {
  final String error_message;
  UserLoginFailure({required this.error_message});
}

final class UserLoginSuccess extends UserLoginState {}
