// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:acdemy/Feature/Registration/Data/Models/AvaliableCourses.dart';
import 'package:acdemy/Feature/Registration/Data/Repo/Registration_Repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'update_avaliable_courses_state.dart';

class UpdateAvaliableCoursesCubit extends Cubit<UpdateAvaliableCoursesState> {
  UpdateAvaliableCoursesCubit(
   {required this.registrationRepo,}
  ) : super(UpdateAvaliableCoursesInitial());

     List<AvaliableCourses>  List_courses =[];

   final RegistrationRepo registrationRepo;

   Future<void> getavailableCourses() async {

     emit(UpdateAvaliableCoursesLoading());
     var result = await registrationRepo.getavailableCourses();
     result.fold(
       (e) {emit(UpdateAvaliableCoursesFailure(errMessage: e));},  
       (data) {
        List_courses = data;
         emit(UpdateAvaliableCoursesSuccess(available_courses: data));
             
         }, 
     );
   }
  void removeCourse({required AvaliableCourses course_elments}){
      List_courses.remove(course_elments);
      emit(RemoveCourse(available_courses: List.from(List_courses)));
  }

     void  addCourse({required AvaliableCourses course_elments}){
      List_courses.add(course_elments);
      emit(AddCourse(available_courses: List.from(List_courses)));
      
  } 
Future< void> getRegistrationStatus() async{
  emit(RegistrationStatusLoading());
  var result = await registrationRepo.getRegistrationStatus();  
  emit(RegistrationStatusSuccess(status: result));
  // List_courses.clear();

}
    void resetState() {
  emit(UpdateAvaliableCoursesInitial());
  List_courses = [];
}

}

