import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_first/model/member_model.dart';
import 'package:my_first/services/server.dart';

class MemeberServices {
  // String baseUrl = 'http://10.0.2.2/api/';
  // String baseUrl = 'http://phpstack-91227-2280011.cloudwaysapps.com/api/';

  Future<List<MemberModel>> getMemeber() async {
    var url = '$baseUrl' + 'index.php/member';
    var response = await http.get(Uri.parse(url));

    print(response);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['member'];
      List<MemberModel> member = [];

      for (var item in data) {
        member.add(MemberModel.formJson(item));
      }
      return member;
    } else {
      throw Exception('gagal get membert');
    }
  }
}
