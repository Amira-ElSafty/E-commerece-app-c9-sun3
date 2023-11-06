import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/failures.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/repository/home_repository_contract.dart';

class AddToCartUseCase{
  HomeRepositoryContract repositoryContract ;
  AddToCartUseCase({required this.repositoryContract});

  Future<Either<Failures, AddToCartResponseEntity>>invoke(String productId){
    return repositoryContract.addToCart(productId);
  }
}