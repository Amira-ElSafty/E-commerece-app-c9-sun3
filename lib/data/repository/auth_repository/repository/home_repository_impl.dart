import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/failures.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/CategoryEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/dataSource/home_remote_data_source.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/repository/home_repository_contract.dart';

class HomeRepositoryImpl implements HomeRepositoryContract{
  HomeRemoteDataSource remoteDataSource ;
  HomeRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories() {
   return remoteDataSource.getAllCategories();
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() {
    return remoteDataSource.getAllBrands();
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts() {
    return remoteDataSource.getAllProducts();
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId) {
   return remoteDataSource.addToCart(productId);
  }

}