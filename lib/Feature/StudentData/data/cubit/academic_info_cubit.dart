// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:acdemy/Feature/StudentData/data/Model/Acdemic_Info.dart';
import 'package:acdemy/Feature/StudentData/data/repo/repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'academic_info_state.dart';

class AcademicInfoCubit extends Cubit<AcademicInfoState> {
  AcademicInfoCubit({
    required this.repo,
  }) : super(AcademicInfoInitial());

  final Repo repo;
  Future<void> getAcademicInfo() async {
    emit(AcademicInfoLoading());

    var data = await repo.getAcademicInfo();
    data.fold((error) => emit(AcademicInfoFailure(error_message: error)),
        (data) {
      emit(AcademicInfoSuccess(academicInfoModel: data));
    });
  }
  void resetState() {
  emit(AcademicInfoInitial());
}
}
