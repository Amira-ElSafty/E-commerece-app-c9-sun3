import 'package:flutter_app_e_commerece_c9_sun/data/Api/failures.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/ProductResponseEntity.dart';

abstract class ProductListTabStates {}

class ProductListTabSuccessState extends ProductListTabStates {
  // response - list category
  ProductResponseEntity responseEntity;

  ProductListTabSuccessState({required this.responseEntity});
}

class ProductListTabInitialState extends ProductListTabStates {}

class ProductListTabLoadingState extends ProductListTabStates {
  String? loadingMessage;

  ProductListTabLoadingState({required this.loadingMessage});
}

class ProductListTabErrorState extends ProductListTabStates {
  Failures errors;

  ProductListTabErrorState({required this.errors});
}
class AddToCartInitialStates extends ProductListTabStates{}
class AddToCartLoadingStates extends ProductListTabStates{
  String? loadingMessage;
  AddToCartLoadingStates({required this.loadingMessage});
}
class AddToCartErrorStates extends ProductListTabStates{
  Failures errors;
  AddToCartErrorStates({required this.errors});
}
class AddToCartSuccessStates extends ProductListTabStates{
  AddToCartResponseEntity responseEntity ;
  AddToCartSuccessStates({required this.responseEntity});
}
