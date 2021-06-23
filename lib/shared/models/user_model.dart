import 'dart:convert';

class UserModel {
  final String name;
  final String email;
  final String? photoUrl;

  UserModel({required this.name, required this.email, required this.photoUrl});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'], email: map['email'], photoUrl: map['photoUrl']);
  }
  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() =>
      {'name': name, 'email': email, 'photoUrl': photoUrl};

  String toJson() => jsonEncode(toMap());
}
