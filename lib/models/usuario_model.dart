// To parse this JSON data, do
//
//     final respuesta = respuestaFromMap(jsonString);

import 'dart:convert';

Respuesta1 respuestaFromMap(String str) => Respuesta1.fromMap(json.decode(str));

String respuestaToMap(Respuesta1 data) => json.encode(data.toMap());

class Respuesta1 {
  Respuesta1({
    required this.user,
  });

  User user;

  factory Respuesta1.fromMap(Map<String, dynamic> json) => Respuesta1(
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "user": user == null ? null : user.toMap(),
      };
}

class User {
  User({
    this.name,
    this.email,
    this.surname,
    this.status,
    this.city,
    this.postalcode,
    this.address,
    this.isAdmin,
    this.uid,
  });

  String? name;
  String? email;
  String? surname;
  bool? status;
  String? city;
  int? postalcode;
  String? address;
  bool? isAdmin;
  String? uid;

  factory User.fromMap(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        surname: json["surname"] == null ? null : json["surname"],
        status: json["status"] == null ? null : json["status"],
        city: json["city"] == null ? null : json["city"],
        postalcode: json["postalcode"] == null ? null : json["postalcode"],
        address: json["address"] == null ? null : json["address"],
        isAdmin: json["isAdmin"] == null ? null : json["isAdmin"],
        uid: json["uid"] == null ? null : json["uid"],
      );

  Map<String, dynamic> toMap() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "surname": surname == null ? null : surname,
        "status": status == null ? null : status,
        "city": city == null ? null : city,
        "postalcode": postalcode == null ? null : postalcode,
        "address": address == null ? null : address,
        "isAdmin": isAdmin == null ? null : isAdmin,
        "uid": uid == null ? null : uid,
      };
}
