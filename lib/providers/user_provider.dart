import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:random_user/models/user_model.dart';

import '../services/user_service.dart';

class UserProvider extends ChangeNotifier{
  UserModel? userModel;
  bool loading = true;
  Future<void> fetchUser() async{
    loading =true;
    notifyListeners();

    userModel = await UserService.fetchRandomUsers();
    loading = false;
    notifyListeners();
  }
}