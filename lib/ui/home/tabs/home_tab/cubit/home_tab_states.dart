import 'package:flutter_app_e_commerece_c9_sun/domain/entities/CategoryEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/ProductResponseEntity.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeTabCategoryLoadingState extends HomeTabStates {
  String? loadingMessage;
  HomeTabCategoryLoadingState({required this.loadingMessage});
}

class HomeTabCategoryErrorState extends HomeTabStates {
  String? errorMessage;
  HomeTabCategoryErrorState({required this.errorMessage});
}

class HomeTabCategorySuccessState extends HomeTabStates {
  // response - list category
  CategoryOrBrandResponseEntity responseEntity;
  HomeTabCategorySuccessState({required this.responseEntity});
}

class HomeTabBrandLoadingState extends HomeTabStates {
  String? loadingMessage;
  HomeTabBrandLoadingState({required this.loadingMessage});
}

class HomeTabBrandErrorState extends HomeTabStates {
  String? errorMessage;
  HomeTabBrandErrorState({required this.errorMessage});
}

class HomeTabBrandSuccessState extends HomeTabStates {
  // response - list category
  CategoryOrBrandResponseEntity responseEntity;
  HomeTabBrandSuccessState({required this.responseEntity});
}
