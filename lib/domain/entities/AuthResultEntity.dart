import 'package:flutter_app_e_commerece_c9_sun/domain/entities/UserEntity.dart';

class AuthResultEntity{
  UserEntity? userEntity ;
  String? token ;

  AuthResultEntity({this.userEntity,this.token});
}