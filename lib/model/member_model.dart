class MemberModel {
  int id;
  String name;
  String username;
  String gambar;

  MemberModel({this.id, this.name, this.username, this.gambar});

  MemberModel.formJson(Map<String, dynamic> json) {
    // id = json['id'];
    name = json['name'];
    username = json['username'];
    gambar = json['gambar'];
  }
  Map<String, dynamic> toJson() {
    return {
      // 'id':id,
      'name': name,
      'username': username,
      'gambar': gambar,
    };
  }
}
