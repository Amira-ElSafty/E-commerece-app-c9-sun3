import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/failures.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/AuthResultEntity.dart';

abstract class AuthRemoteDataSource{
  Future<Either<Failures,AuthResultEntity>> register(String name,String email, String password , String rePassword ,
      String phone);

  Future<Either<Failures,AuthResultEntity>>login(String email, String password);

}