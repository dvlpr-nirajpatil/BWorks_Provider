class UserDataModel {
  String? email;
  String? uid;
  String? name;
  String? contact;

  UserDataModel({this.email, this.uid, this.name, this.contact});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    email = json["email"];
    uid = json["uid"];
    name = json["name"];
    contact = json["contact"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["email"] = email;
    _data["uid"] = uid;
    _data["name"] = name;
    _data["contact"] = contact;
    return _data;
  }
}
