import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/base_serror.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/AuthResultEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/repository/auth_repository_contract.dart';

class RegisterUseCase{
  AuthRepositoryContract repositoryContract ;
  RegisterUseCase({required this.repositoryContract});
  /// register
  Future<Either<BaseError,AuthResultEntity>> invoke(String name,String email, String password , String rePassword ,
      String phone)async{
    var either = await repositoryContract.register(name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    },
            (response) {
      return Right(response);
            });
  }
}
RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(repositoryContract: injectAuthRepository());
}