import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/base_serror.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/AuthResultEntity.dart';

abstract class AuthRepositoryContract{
  Future<Either<BaseError,AuthResultEntity>> register(String name,String email, String password , String rePassword ,
      String phone);

  Future<Either<BaseError,AuthResultEntity>>login(String email, String password);
}