// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:acdemy/core/helper/Errors/Exception.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:acdemy/Feature/AcademicAlert&Tranning/Data/Repo/WarningsRepo.dart';
import 'package:acdemy/Feature/AcademicAlert&Tranning/Data/models/WarningModel.dart';

part 'warnings_state.dart';

class WarningsCubit extends Cubit<WarningsState> {
  WarningsCubit(
   { required this.warningsRepoImpl}
  ) : super(WarningsInitial());

  final  Warningsrepo warningsRepoImpl ;

  Future<void> getWarnings() async {
    emit(WarningsLoading());
    try {
      List<WarningModel> warnings_List = await warningsRepoImpl.getWarnings();
      if (warnings_List.isEmpty) {
        emit(WarningsFailure(error: 'No Data'));
      }
      emit(WarningsSuccess(warningsList: warnings_List));
    } on ServerException catch (e) {
      emit(WarningsFailure(error: e.toString()));
    }
  }
}
