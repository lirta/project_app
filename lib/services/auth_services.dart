import 'dart:convert';

import 'package:my_first/model/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'http://10.0.2.2/api/tes/';

  Future<UserModel> register({
    String name,
    // String username,
    String email,
    // String phone,
    String password,
  }) async {
    var url = '$baseUrl/register.php';
    var body = jsonEncode({
      'name': name,
      // 'username': username,
      'email': email,
      'password': password
    });

    // print(body);
    var response = await http.post(
      Uri.parse(url),
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }
  Future<UserModel> login({
    String email,
    String password,
  }) async {
    var url = '$baseUrl/login.php';
    var body = jsonEncode({
      'email': email,
      'password': password
    });

    print(body);
    var response = await http.post(
      Uri.parse(url),
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      return user;
    } else {
      throw Exception('Gagal login');
    }
  }
}
