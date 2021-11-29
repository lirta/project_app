import 'dart:convert';

import 'package:my_first/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // String baseUrl = 'http://10.0.2.2/api/';
  String baseUrl = 'http://phpstack-91227-2280011.cloudwaysapps.com/api/';

  Future<UserModel> register({
    String name,
    String username,
    String email,
    String password,
  }) async {
    var url = '$baseUrl' + 'register.php';

    var response = await http.post(
      Uri.parse(url),
      body: {
        'name': name,
        'username': username,
        'email': email,
        'password': password
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      UserModel user = UserModel.fromJson(data);
      print(user);
      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String email,
    String password,
  }) async {
    var url = '$baseUrl' + 'login.php';
    var body = {'email': email, 'password': password};

    print(body);
    var response = await http.post(
      Uri.parse(url),
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      throw Exception('Gagal login');
    }
  }

  Future<UserModel> editUsername({
    String email,
    String username,
  }) async {
    var url = '$baseUrl' + 'edit_username.php';
    var body = {'email': email, 'username': username};

    print(body);
    var response = await http.post(
      Uri.parse(url),
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      throw Exception('Gagal Edit username');
    }
  }

  Future<UserModel> editEmail({
    String email,
    String username,
  }) async {
    var url = '$baseUrl' + 'edit_email.php';
    var body = {'email': email, 'username': username};

    print(body);
    var response = await http.post(
      Uri.parse(url),
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      throw Exception('Gagal Edit email');
    }
  }

  Future<UserModel> profile({
    String email,
    String name,
    String image,
  }) async {
    var url = '$baseUrl' + 'edit_password.php';
    var body = {
      'email': email,
      'name': name,
      'image': image,
    };

    print(body);
    var response = await http.post(
      Uri.parse(url),
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      // UserModel user = UserModel.fromJson(data);
      return data;
    } else {
      throw Exception('Gagal Edit password');
    }
  }

  Future<UserModel> editPassword({
    String email,
    String password,
    String newpassword,
  }) async {
    var url = '$baseUrl' + 'edit_password.php';
    var body = {
      'email': email,
      'password': password,
      'newpassword': newpassword,
    };

    print(body);
    var response = await http.post(
      Uri.parse(url),
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['error_msg'];
      return data;
    } else {
      throw Exception('Gagal Edit password');
    }
  }

  // Future<UserModel> editprofile({String email, String name}) async {
  //   var url = '$baseUrl' + 'profile.php';
  //   var body = {
  //     'email': email,
  //     'name': name,
  //   };

  //   print(body);
  //   var response = await http.post(
  //     Uri.parse(url),
  //     body: body,
  //   );

  //   if (response.statusCode == 200) {
  //     print("sucsess");
  //   } else {
  //     print("gagal");
  //   }
  // }

  Future<UserModel> getuser({
    String email,
  }) async {
    var url = '$baseUrl' + 'getUserEmail.php';
    var body = {
      'email': email,
    };

    print(body);
    var response = await http.post(
      Uri.parse(url),
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      throw Exception('get data user gagal');
    }
  }
}
