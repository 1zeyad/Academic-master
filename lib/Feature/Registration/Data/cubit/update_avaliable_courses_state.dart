part of 'update_avaliable_courses_cubit.dart';

@immutable
sealed class UpdateAvaliableCoursesState {}

final class UpdateAvaliableCoursesInitial extends UpdateAvaliableCoursesState {}

final class RemoveCourse extends UpdateAvaliableCoursesState {
  final List<AvaliableCourses> available_courses;

  RemoveCourse({required this.available_courses});
}

final class AddCourse extends UpdateAvaliableCoursesState {
  final List<AvaliableCourses> available_courses;

  AddCourse({required this.available_courses});
}

final class UpdateAvaliableCoursesLoading extends UpdateAvaliableCoursesState {}

final class UpdateAvaliableCoursesSuccess extends UpdateAvaliableCoursesState {
  final List<AvaliableCourses> available_courses;

  UpdateAvaliableCoursesSuccess({required this.available_courses});
}

class UpdateAvaliableCoursesFailure extends UpdateAvaliableCoursesState {
  final String errMessage;

  UpdateAvaliableCoursesFailure({required this.errMessage});
}


// state Registration status

final class RegistrationStatusLoading extends UpdateAvaliableCoursesState {}

final class RegistrationStatusSuccess extends UpdateAvaliableCoursesState {
  final bool status;

  RegistrationStatusSuccess({required this.status});
}