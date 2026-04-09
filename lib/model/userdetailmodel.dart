class UserDataModel {
  final UserResult result;

  UserDataModel({
    this.result,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      result: UserResult.fromJson(json),
    );
  }
}

class UserResult {
  int id;
  String name;
  String email;
  String phone;

  UserResult({this.id, this.email, this.name, this.phone});

  factory UserResult.fromJson(Map<String, dynamic> json) {
    return UserResult(
      id: json['id'],
      name: json['name'],
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
    );
  }
}
