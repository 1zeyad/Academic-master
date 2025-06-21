part of 'term_grades_cubit.dart';

@immutable
sealed class TermGradesState {}

final class TermGradesInitial extends TermGradesState {}

final class TermGradesLoading extends TermGradesState {}

final class TermGradesSuccess extends TermGradesState {
  final List<TermGrades> List_Termgrades;
  TermGradesSuccess({required this.List_Termgrades});
}

final class TermGradesFailure extends TermGradesState {
  final String errMessage;
  TermGradesFailure({required this.errMessage});
}  
