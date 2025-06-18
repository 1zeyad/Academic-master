import 'dart:convert';
import 'dart:developer';
import 'package:acdemy/Feature/Registration/Data/Models/AvaliableCourses.dart';
import 'package:acdemy/Feature/StudentData/data/Model/Acdemic_Info.dart';
import 'package:acdemy/Feature/StudentData/data/Model/personal_info.dart';
import 'package:acdemy/core/helper/Local_cache/local_cache.dart';
import 'package:acdemy/core/helper/end_points/Api_endpoints.dart';

AcademicInfo? getUserAcademicInfo() {
  var jsonString = CacheHelper.getData(key: Keys.KacademicInfooo);

  if (jsonString == null || jsonString is! String) {
    log("Academic info jsonString is null or not a string");
    return null;
  }

  try {
    var userData = AcademicInfo.fromJson(jsonDecode(jsonString));
    return userData;
  } catch (e) {
    log("Error decoding academic info: $e");
    return null;
  }
}

PersonalInfo? getUserPersonalData() {
  var jsonString = CacheHelper.getData(key: Keys.KpersonalInfo);

  if (jsonString == null || jsonString is! String) {
    log("Personal info jsonString is null or not a string");
    return null;
  }

  try {
    var userData = PersonalInfo.fromJson(jsonDecode(jsonString));
    return userData;
  } catch (e) {
    log("Error decoding personal info: $e");
    return null;
  }
}


// List<AvaliableCourses>  getMycourses() {
//    var jsonString = CacheHelper.getData(key: Keys.KAvailableCourses);
//    if(jsonString==null){
//     log("jsonString is null");}
//    var  available_courses = parseData(jsonDecode(jsonString));
//    return available_courses;
// }