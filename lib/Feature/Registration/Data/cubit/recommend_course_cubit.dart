// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:acdemy/Feature/Registration/Data/Models/AvaliableCourses.dart';
import 'package:acdemy/Feature/Registration/Data/Repo/Registration_Repo.dart';

part 'recommend_course_state.dart';

class RecommendCourseCubit extends Cubit<RecommendCourseState> {
  RecommendCourseCubit(
    { required this.registrationRepo,}
  ) : super(RecommendCourseInitial());
     final RegistrationRepo registrationRepo;
     
  Future<void> getMyRecommendedCourses() async {
     emit(RecommendCourseLoading());
     var result = await registrationRepo.getMyRecommendedCourses();
     result.fold(
       (e) {emit(RecommendCourseFailure(errMessage: e));},  
       (data) {
       
         emit( RecommendCourseSuccess(Recommended_courses: data));
             
         }, 
     );
   }
       void resetState() {
  emit(RecommendCourseInitial());
}


}
