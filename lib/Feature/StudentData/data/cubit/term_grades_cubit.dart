import 'package:acdemy/Feature/StudentData/data/Model/term_Grades.dart';
import 'package:acdemy/Feature/StudentData/data/repo/repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'term_grades_state.dart';

class TermGradesCubit extends Cubit<TermGradesState> {
  TermGradesCubit({required this.repo}) : super(TermGradesInitial());

  final Repo repo;
  
  Future<void> getTermGrades() async {
    emit(TermGradesLoading());
    var result = await repo.getTermGrades();
    
    result.fold(
      (e) => emit(TermGradesFailure(errMessage: e)), 
      (data) => emit(TermGradesSuccess(List_Termgrades: data)), 
    );
  }
  
  void resetState() {
  emit(TermGradesInitial());
}
}
