import 'package:acdemy/Feature/AcademicAlert&Tranning/Data/models/WarningModel.dart';

abstract class Warningsrepo {

  Future <List<WarningModel>> getWarnings();

  }
