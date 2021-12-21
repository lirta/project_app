// import 'dart:io';

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

  Future<bool> getUser({String id}) async {
    try {
      UserModel user = await AuthService().cekLogin(id: id);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> register(
      {String name, String username, String email, String password}) async {
    try {
      UserModel user = await AuthService().register(
          name: name, username: username, email: email, password: password);
      _user = user;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> loginGoogle({String name, String email, String gambar}) async {
    try {
      UserModel user = await AuthService()
          .loginGoogle(name: name, email: email, gambar: gambar);
      _user = user;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> loginApple({String name, String email}) async {
    try {
      UserModel user = await AuthService().loginApple(name: name, email: email);
      _user = user;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({String email, String password}) async {
    try {
      UserModel user =
          await AuthService().login(email: email, password: password);
      _user = user;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> singOut() async {
    // await _user.signOut();
  }

  Future<bool> editUsername({String email, String username}) async {
    try {
      UserModel user =
          await AuthService().editUsername(email: email, username: username);
      _user = user;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> editEmail({String email, String username}) async {
    try {
      UserModel user =
          await AuthService().editEmail(email: email, username: username);
      _user = user;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> editPassword(
      {String email, String password, String newpassword}) async {
    try {
      UserModel user = await AuthService().editPassword(
          email: email, password: password, newpassword: newpassword);
      _user = user;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> getuser({String email}) async {
    try {
      UserModel user = await AuthService().getuser(
        email: email,
      );
      _user = user;

      return true;
    } catch (e) {
      return false;
    }
  }

  // ignore: non_constant_identifier_names
  Future<bool> edit_profile({String email, String name}) async {
    try {
      UserModel user =
          await AuthService().editProfile(email: email, name: name);
      _user = user;

      return true;
    } catch (e) {
      return false;
    }
  }
}
