import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  
  static  late SharedPreferences  sharedPreferences;



  static init() async{
    WidgetsFlutterBinding.ensureInitialized();
    sharedPreferences =await SharedPreferences.getInstance();
   }

// the method to get data in local database using key

// String? getDataString({
//   required String key,
// }){
//   return sharedPreferences.getString(key);
// }

// the method to put data in local database 

static Future<bool> saveData ({required String key,required dynamic value})async{

  if(value is bool){
    return await sharedPreferences.setBool(key, value);
  }

  if(value is String){
    return await sharedPreferences.setString(key, value);
  }

  if(value is int){
    return await sharedPreferences.setInt(key, value);
  }
  
  else{
    return await sharedPreferences.setDouble(key, value);
  }

}

// method to get data already saved in local data base

static dynamic getData ({required String key}){
  return sharedPreferences.get(key);
}


// method remove data using specific key
Future<bool> removeData ({required String key})async{
return await sharedPreferences.remove(key);
}

// method check if lcal database contain {key}

static Future<bool> containKey({required String key})async{
return sharedPreferences.containsKey(key);
}

// clear all data in local database

static Future<bool> clearData() async{
  return await sharedPreferences.clear();
}
}