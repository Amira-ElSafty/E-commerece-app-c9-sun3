import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/home_screen/cubit/home_screen_states.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/tabs/favorite_tab/favorite_tab.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/tabs/home_tab/home_tab.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/tabs/product_tab/product_list_tab.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/tabs/profile_tab/profile_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeScreenInitialState());

  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];
  void changeBottomNavigationBar(int newSelectedIndex){
    HomeScreenInitialState();
    selectedIndex = newSelectedIndex ;
    emit(ChangeBottomNavigationBarState());
  }
}