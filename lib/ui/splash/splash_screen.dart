import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/auth/login/login_screen.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/auth/register/register_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash screen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);
    });
    return Scaffold(
        body: Image.asset(
      'assets/images/Splash Screen.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ));
  }
}
