import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/register_use_case.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/auth/register/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase ;
  RegisterScreenViewModel({required this.registerUseCase}) : super(RegisterInitialState());
  // hold data - handle logic
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmationPasswordController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObsecure = true;

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState(loadingMessage: 'Loading...'));
      try {
        var response = await registerUseCase.invoke(
            nameController.text,
            emailController.text,
            passwordController.text,
            confirmationPasswordController.text,
            phoneController.text);
        if (response.message != 'success') {
          emit(RegisterErrorState(errorMessage: response.message!));
        } else {
          emit(RegisterSuccuessState(response: response));
        }
      } catch (e) {
        emit(RegisterErrorState(errorMessage: e.toString()));
      }
    }
  }
}
