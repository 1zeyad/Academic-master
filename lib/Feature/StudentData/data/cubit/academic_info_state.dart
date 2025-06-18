part of 'academic_info_cubit.dart';

@immutable
sealed class AcademicInfoState {}

final class AcademicInfoInitial extends AcademicInfoState {}

final class AcademicInfoLoading extends AcademicInfoState {}

final class AcademicInfoSuccess extends AcademicInfoState {
  final AcademicInfo academicInfoModel;

  AcademicInfoSuccess({required this.academicInfoModel});

}
final class AcademicInfoFailure extends AcademicInfoState {
  final String error_message;
  AcademicInfoFailure({required this.error_message});
}

