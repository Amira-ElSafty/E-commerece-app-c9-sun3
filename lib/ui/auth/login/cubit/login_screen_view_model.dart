import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/login_use_case.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/auth/login/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenViewModel extends Cubit<LoginStates>{
  LoginUseCase loginUseCase ;
  LoginScreenViewModel({required this.loginUseCase}):super(LoginInitialState());
  //todo: hold data - handle logic

  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isObscure = true;

  void login()async{
    if(formKey.currentState?.validate() == true){
      // login
      emit(LoginLoadingState(loadingMessage: 'Loading...'));
      var either = await loginUseCase.invoke(emailController.text, passwordController.text);
      either.fold((l) {
        emit(LoginErrorState(errorMessage: l.errorMessage));
      }, (response) {
        emit(LoginSuccessState(response: response));
      });
    }
  }
}