import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:random_user/models/user_model.dart';

class UserService{
  static final Dio dio = Dio();
  
  static Future<UserModel> fetchRandomUsers() async{
    try{
      Response response = await dio.get('https://randomuser.me/api/?results=5');
      return UserModel.fromJson(response.data);
    }
    catch(ex){
      if (kDebugMode) {
        print('Error :$ex');
      }
      throw Exception('Error fetching users : $ex');
    }
  }
}