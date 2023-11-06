import 'package:flutter_app_e_commerece_c9_sun/domain/entities/AuthResultEntity.dart';

abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{
  String? loadingMessage ;
  LoginLoadingState({this.loadingMessage});
}

class LoginErrorState extends LoginStates{
  String? errorMessage ;
  LoginErrorState({this.errorMessage});
}

class LoginSuccessState extends LoginStates{
  /// response
  AuthResultEntity response ;
  LoginSuccessState({required this.response});
}
