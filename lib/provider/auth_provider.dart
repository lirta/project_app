import 'package:flutter/cupertino.dart';
import 'package:my_first/model/user_model.dart';
import 'package:my_first/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register(
      {String name, String username, String email, String password}) async {
    try {
      UserModel user = await AuthService().register(
          name: name, username: username, email: email, password: password);
      _user = user;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
