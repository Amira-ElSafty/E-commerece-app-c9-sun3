import 'package:flutter_app_e_commerece_c9_sun/data/model/response/RegisterResponse.dart';

abstract class RegisterStates{}

class RegisterLoadingState extends RegisterStates{
  String? loadingMessage ;
  RegisterLoadingState({required this.loadingMessage});
}
class RegisterInitialState extends RegisterStates{

}
class RegisterErrorState extends RegisterStates{
  String? errorMessage ;
  RegisterErrorState({required this.errorMessage});
}
class RegisterSuccuessState extends RegisterStates{
  RegisterResponse response ;
  RegisterSuccuessState({required this.response});
}