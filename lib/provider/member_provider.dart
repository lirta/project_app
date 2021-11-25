import 'package:flutter/cupertino.dart';
import 'package:my_first/model/member_model.dart';
import 'package:my_first/services/member_services.dart';

class MemberProvider with ChangeNotifier {
  List<MemberModel> _member = [];
  List<MemberModel> get member => _member;

  set member(List<MemberModel> member) {
    _member = member;
    notifyListeners();
  }

  Future<void> getMember() async {
    try {
      List<MemberModel> member = await MemeberServices().getMemeber();
      _member = member;
    } catch (e) {
      print(e);
    }
  }
}
