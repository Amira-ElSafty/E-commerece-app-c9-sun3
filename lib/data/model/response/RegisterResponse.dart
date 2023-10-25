import 'package:flutter_app_e_commerece_c9_sun/data/model/response/Error.dart';

import 'User.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"test200000@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MzkxMjU5MjQ5NGQ5MmQxNjIwM2YzYyIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4MjM5MDY2LCJleHAiOjE3MDYwMTUwNjZ9.XYLX4IKuk0bMZGnsoq8WUERq-okn9inM02Pumo08MWU"

class RegisterResponse {
  RegisterResponse({
      this.message, 
      this.user,
    this.error,
    this.statusMsg,
      this.token,});

  RegisterResponse.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    error = json['errors'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  User? user;
  String? token;
  Error? error ;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    map['errors'] = error;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}