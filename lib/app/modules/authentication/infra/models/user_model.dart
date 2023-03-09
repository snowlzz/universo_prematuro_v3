import 'dart:convert';



// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? uid;
  String? name;
  String? email;
  String? pass;
  String? registration;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.pass,
    this.registration,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'pass': pass,
      'registration': registration,
     

    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      pass: map['pass'] != null ? map['pass'] as String : null,
      registration: map['registration'] != null ? map['registration'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
