import 'package:flutter_app_e_commerece_c9_sun/data/model/response/UserDto.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/AuthResultEntity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutti12@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzZGQ2OTZjMTExYzAyYTY3ODE3NTIyOCIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk4NTkyNTczLCJleHAiOjE3MDYzNjg1NzN9.JHtNHU_ppWo69BdhUPtC0-Dj7rAgtpDuFwuqiCGlhYQ"

class LoginResponse {
  LoginResponse({
      this.message, 
      this.user,
    this.statusMsg,
      this.token,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(
      userEntity: user?.toUserEntity(),
      token: token
    );
  }
}
