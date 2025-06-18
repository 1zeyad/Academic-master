import 'package:acdemy/Feature/plans&Regulations/Data/Models/Plan_Model.dart';
import 'package:acdemy/Feature/plans&Regulations/Data/Repo/repo_Regulation&Plan.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'plan_state.dart';

class PlanCubit extends Cubit<PlanState> {
  PlanCubit({required this.repo4}) : super(PlanInitial());

  final Repo4 repo4;
  Future<void> getMyPlans() async {
    emit(PlanLoading());
    var result = await repo4.getmyPlan();
    result.fold(
      (errorMessage) => emit(PlanFailure(errorMessage: errorMessage)),
      (Myplans) => emit(PlanSuccess(Plans: Myplans)),
    );
  }
}
