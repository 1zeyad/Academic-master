import 'package:acdemy/Feature/Registration/Data/Models/AvaliableCourses.dart';
import 'package:acdemy/Feature/Registration/Data/Repo/Registration_Repo.dart';
import 'package:acdemy/Feature/Registration/Data/cubit/Selcted_courses_state.dart';
import 'package:acdemy/core/helper/Errors/Exception.dart';
import 'package:bloc/bloc.dart';

class SelctedCoursesCubit extends Cubit<SelctedCoursesState> {
  SelctedCoursesCubit({required this.registrationRepo})
      : super(CoursesInitial());

  final RegistrationRepo registrationRepo;

  List<AvaliableCourses> selectedCourses = [];

 // Register for term
  Future<void> courseRegistration({required List<String> id_Courses}) async {
    emit(SelctedCoursesLoading());
    try {
      var result =
          await registrationRepo.courseRegistration(id_Courses: id_Courses);
      emit(SelctedCoursesSuccess(message: result));
      return emit(SelctedCoursesSuccess(
          message: result)); // clear after register selectedCourses.clear();
    } on ServerException catch (e) {
      emit(SelctedCoursesFailure(errMessage: e.errMessage));
    }
  }

  void addCourse_Selction({required AvaliableCourses courseElements}) {
    if (!selectedCourses.contains(courseElements)) {
      selectedCourses.add(courseElements);
    }
    emit(AddCourseSection(available_courses: List.from(selectedCourses)));
  }

  void removeCourse_Selction({required AvaliableCourses courseElements}) {
    if (!selectedCourses.isEmpty) {
      selectedCourses.remove(courseElements);
      emit(
          RemoveCourseSelection(available_courses: List.from(selectedCourses)));
    }

    emit(RemoveCourseSelection(available_courses: List.from(selectedCourses)));
  }

  void resetState() {
    emit(CoursesInitial());
    selectedCourses = [];
  }
}
