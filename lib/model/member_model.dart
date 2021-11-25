class MemberModel {
  int id;
  String name;
  String username;

  MemberModel({this.id, this.name, this.username});

  MemberModel.formJson(Map<String, dynamic> json) {
    // id = json['id'];
    name = json['name'];
    username = json['username'];
  }
  Map<String, dynamic> toJson(){
    return{
      // 'id':id,
      'name':name,
      'username':username,
    };
  }
}
