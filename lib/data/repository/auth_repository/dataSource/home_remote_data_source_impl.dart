import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/api_manager.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/failures.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/CategoryEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/dataSource/home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  ApiManager apiManager ;
  HomeRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllCategories()async {
   var either = await apiManager.getCategories();
   return either.fold((error) {
     return Left(Failures(errorMessage: error.errorMessage));
   },
           (response) {
     return Right(response);
           });
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async{
    var either = await apiManager.getBrands();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    },
            (response) {
          return Right(response);
        });
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getAllProducts()async {
    var either = await apiManager.getProducts();
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    },
            (response) {
          return Right(response);
        });
  }

  @override
  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId)async {
    var either = await apiManager.addToCart(productId);
    return either.fold((error) {
      return Left(Failures(errorMessage: error.errorMessage));
    },
            (response) {
          return Right(response);
        });
  }

}