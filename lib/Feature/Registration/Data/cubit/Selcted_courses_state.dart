import 'package:acdemy/Feature/Registration/Data/Models/AvaliableCourses.dart';

sealed class SelctedCoursesState {}

final class CoursesInitial extends SelctedCoursesState {}

final class SelctedCoursesLoading extends SelctedCoursesState {}

final class SelctedCoursesSuccess extends SelctedCoursesState {
  final String message;

  SelctedCoursesSuccess({required this.message});
}

final class SelctedCoursesFailure extends SelctedCoursesState {
  final String errMessage;

  SelctedCoursesFailure({required this.errMessage});
}

final class AddCourseSection extends SelctedCoursesState {
  final List<AvaliableCourses> available_courses;

  AddCourseSection({required this.available_courses});
}

final class RemoveCourseSelection extends SelctedCoursesState { 
  final List<AvaliableCourses>available_courses;

  RemoveCourseSelection({required this.available_courses});
}
