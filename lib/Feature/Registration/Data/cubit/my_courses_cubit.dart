// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:acdemy/Feature/Registration/Data/Models/AvaliableCourses.dart';
import 'package:acdemy/Feature/Registration/Data/Repo/Registration_Repo.dart';
import 'package:acdemy/Feature/Registration/Data/Repo/Registration_Repo_impl.dart';

part 'my_courses_state.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  MyCoursesCubit(
    {required this.registrationRepo,}
  ) : super(MyCoursesInitial());

final RegistrationRepo registrationRepo;
  Future<void> getMyCourses() async {
    emit(MyCourseLoading());
    var result = await registrationRepo.getMyCourses();
    result.fold(
      (error) {emit(MyCourseFailure(erroMessage: error));},
      (data) {emit( MycourseSuccess(My_courses: data));},
    );
  }
    void resetState() {
  emit(MyCoursesInitial());
}
}
