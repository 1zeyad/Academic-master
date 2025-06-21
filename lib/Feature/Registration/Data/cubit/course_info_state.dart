part of 'course_info_cubit.dart';

@immutable
sealed class CourseInfoState {}

final class CourseInfoInitial extends CourseInfoState {}

final class CourseInfoLoading extends CourseInfoState {}


final class CourseInfoSuccess extends CourseInfoState {
  final AvaliableCourses course_info;
  CourseInfoSuccess({required this.course_info});
}

final class CourseInfoFailure extends CourseInfoState {
  final String errMessage;
  CourseInfoFailure({required this.errMessage});
}

