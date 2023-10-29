import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/register_use_case.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/auth/register/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreenViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase ;
  RegisterScreenViewModel({required this.registerUseCase}) : super(RegisterInitialState());
  // hold data - handle logic
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: 'adham');
  var passwordController = TextEditingController(text: '123456');
  var confirmationPasswordController = TextEditingController(text: '123456');
  var emailController = TextEditingController(text: 'adham15@route.com');
  var phoneController = TextEditingController(text: '01023232321');
  bool isObsecure = true;

  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState(loadingMessage: 'Loading...'));
        var either = await registerUseCase.invoke(
            nameController.text,
            emailController.text,
            passwordController.text,
            confirmationPasswordController.text,
            phoneController.text);
       either.fold((l) {
         emit(RegisterErrorState(errorMessage: l.errorMessage));
         print(l.errorMessage);
       },
               (response){
         emit(RegisterSuccuessState(response: response));
         print(response.token);
               });
    }

  }
}
