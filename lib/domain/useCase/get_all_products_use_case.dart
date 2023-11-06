import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/failures.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/CategoryEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/repository/home_repository_contract.dart';

class GetAllProductsUseCase{
  // repository
  HomeRepositoryContract repositoryContract ;
  GetAllProductsUseCase({required this.repositoryContract});

  Future<Either<Failures, ProductResponseEntity>> invoke(){
    return repositoryContract.getAllProducts();
  }
}