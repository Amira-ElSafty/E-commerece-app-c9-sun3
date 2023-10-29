import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/base_serror.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/AuthResultEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/repository/auth_repository_contract.dart';

class LoginUseCase{
  /// repository
  AuthRepositoryContract repositoryContract ;
  LoginUseCase({required this.repositoryContract});

  Future<Either<BaseError, AuthResultEntity>> invoke(String email , String password)async{
    var either = await repositoryContract.login(email, password);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response);
    });
  }
}
LoginUseCase injectLoginUseCase(){
  return LoginUseCase(repositoryContract: injectAuthRepository());
}