import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/base_serror.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/model/response/RegisterResponse.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/AuthResultEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/dataSource/auth_remote_data_source.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/repository/auth_repository/dataSource/auth_remote_data_source_impl.dart';

class AuthRepositoryImpl implements AuthRepositoryContract{
  AuthRemoteDataSource remoteDataSource ;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<BaseError,AuthResultEntity>> register(String name, String email, String password, String rePassword, String phone) {
    return remoteDataSource.register(name, email, password, rePassword, phone);
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }

}
AuthRepositoryContract injectAuthRepository(){
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}