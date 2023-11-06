import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/failures.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/AddToCartResponseEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/CategoryEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/ProductResponseEntity.dart';

abstract class HomeRepositoryContract{
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllCategories();
  Future<Either<Failures,CategoryOrBrandResponseEntity>> getAllBrands();
  Future<Either<Failures,ProductResponseEntity>> getAllProducts();
  Future<Either<Failures,AddToCartResponseEntity>>addToCart(String productId);

}