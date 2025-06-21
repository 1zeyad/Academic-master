part of 'warnings_cubit.dart';

@immutable
sealed class WarningsState {}

final class WarningsInitial extends WarningsState {}



final class WarningsSuccess extends WarningsState {

  final List<WarningModel> warningsList;
  WarningsSuccess({required this.warningsList });

}

final class WarningsLoading extends WarningsState {}

final class WarningsFailure extends WarningsState {
  final String error;
  WarningsFailure({required this.error});
}
