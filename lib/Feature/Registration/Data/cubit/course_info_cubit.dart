import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:acdemy/Feature/Registration/Data/Models/AvaliableCourses.dart';
import 'package:acdemy/Feature/Registration/Data/Repo/Registration_Repo.dart';

part 'course_info_state.dart';

class CourseInfoCubit extends Cubit<CourseInfoState> {
  CourseInfoCubit(
    { required this.registrationRepo}
  ) : super(CourseInfoInitial());
  
  final RegistrationRepo  registrationRepo;

  Future<void> getCourseDetails({required String id}) async{
    emit(CourseInfoLoading());
    var result = await registrationRepo.getCourseDetails(id: id);
    result.fold(
      (error) {emit(CourseInfoFailure(errMessage: error));},
      (data) {emit(CourseInfoSuccess( course_info: data));},
    );
  }
         void resetState() {
  emit(CourseInfoInitial());
}

}