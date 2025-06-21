part of 'personal_info_cubit.dart';

@immutable
sealed class PersonalInfoState {}

final class PersonalInfoInitial extends PersonalInfoState {}

final class PersonalInfoLoading extends PersonalInfoState {}
final class PersonalInfoFailure extends PersonalInfoState {
  final String error_message;
  PersonalInfoFailure({required this.error_message});

}

final class PersonalInfoSuccess extends PersonalInfoState {

  final PersonalInfo personalInfoModel;
  PersonalInfoSuccess({required this.personalInfoModel});
}