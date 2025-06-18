// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:acdemy/Feature/plans&Regulations/Data/Models/Regulation_Model.dart';
import 'package:acdemy/Feature/plans&Regulations/Data/Repo/repo_Regulation&Plan.dart';

part 'regulation_state.dart';

class RegulationCubit extends Cubit<RegulationState> {

  RegulationCubit(
   {required this.repo4}
  ) : super(RegulationInitial());

    final Repo4 repo4 ;
  Future<void>  getRegulation() async {
    log("getRegulation() called");
    emit(RegulationLoading());
    var result =await  repo4.getmyRegulation();
    result.fold(
      (errorMessage) => emit(RegulationFailure(errorMessage: errorMessage)),  
       (MyRegulation) => emit(RegulationSuccess(regulation:  MyRegulation)),
       );

      
  }
}
