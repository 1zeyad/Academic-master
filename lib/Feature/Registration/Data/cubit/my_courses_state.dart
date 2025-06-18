part of 'my_courses_cubit.dart';

@immutable
sealed class MyCoursesState {}

final class MyCoursesInitial extends MyCoursesState {}

final class  MyCourseLoading extends MyCoursesState {}

final class MycourseSuccess extends MyCoursesState {
  final List<AvaliableCourses> My_courses;
  MycourseSuccess({required this.My_courses});
}

final class MyCourseFailure extends MyCoursesState {
  final String erroMessage;
  MyCourseFailure({required this.erroMessage});
}

