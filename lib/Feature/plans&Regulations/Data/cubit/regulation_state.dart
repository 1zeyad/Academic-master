part of 'regulation_cubit.dart';

@immutable
sealed class RegulationState {}

final class RegulationInitial extends RegulationState {}

final class RegulationSuccess extends RegulationState {
  final Regulation regulation;

  RegulationSuccess({required this.regulation});
}

final class RegulationFailure extends RegulationState {
  final String errorMessage;

  RegulationFailure({required this.errorMessage});
}

final class RegulationLoading extends RegulationState {}
