part of 'plan_cubit.dart';

@immutable
sealed class PlanState {}

final class PlanInitial extends PlanState {}

final class PlanSuccess extends PlanState {
  final List<PlanModel> Plans;

  PlanSuccess({required this.Plans});
}

final class PlanFailure extends PlanState {
  final String errorMessage;

  PlanFailure({required this.errorMessage});
}

final class PlanLoading extends PlanState {}
