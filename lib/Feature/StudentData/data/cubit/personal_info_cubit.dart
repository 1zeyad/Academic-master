import 'package:acdemy/Feature/Auth/Data/repos/repo.dart';
import 'package:acdemy/Feature/StudentData/data/Model/personal_info.dart';
import 'package:acdemy/Feature/StudentData/data/repo/repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'personal_info_state.dart';

class PersonalInfoCubit extends Cubit<PersonalInfoState> {
  PersonalInfoCubit({required this.repo}) : super(PersonalInfoInitial());

  final Repo repo;

  Future<void> getPersonalInfo() async {
    emit(PersonalInfoLoading());

    var result = await repo.getPersonalInfo();
    result.fold((e) => emit(PersonalInfoFailure(error_message: e.toString())),
        (data) async {
      emit(PersonalInfoSuccess(personalInfoModel: data));
    });
  }
  
  void resetState() {
  emit(PersonalInfoInitial());
}
}
