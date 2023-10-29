import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/auth/login/login_screen.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/auth/register/register_screen.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/home_screen_view.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/product/product_details/product_details_view.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/splash/splash_screen.dart';
import 'package:flutter_app_e_commerece_c9_sun/utils/app_theme.dart';
import 'package:flutter_app_e_commerece_c9_sun/utils/my_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              HomeScreenView.routeName: (context) =>  HomeScreenView(),
              ProductDetailsView.routeName: (context) =>  ProductDetailsView(),
            },
            theme: AppTheme.mainTheme,
          );
        });
  }
}
