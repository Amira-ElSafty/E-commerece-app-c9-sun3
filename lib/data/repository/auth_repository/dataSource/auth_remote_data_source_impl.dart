import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/api_manager.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/base_serror.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/model/response/RegisterResponse.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/AuthResultEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/dataSource/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<BaseError, AuthResultEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either =
        await apiManager.register(name, email, password, rePassword, phone);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }

  @override
  Future<Either<BaseError, AuthResultEntity>> login(
      String email, String password) async {
    var either = await apiManager.login(email, password);
    return either.fold((l) {
      return Left(BaseError(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }
}

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
