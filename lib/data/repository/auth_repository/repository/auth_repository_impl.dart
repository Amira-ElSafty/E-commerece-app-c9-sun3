import 'package:flutter_app_e_commerece_c9_sun/data/model/response/RegisterResponse.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/dataSource/auth_remote_data_source.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/repository/auth_repository/dataSource/auth_remote_data_source_impl.dart';

class AuthRepositoryImpl implements AuthRepositoryContract{
  AuthRemoteDataSource remoteDataSource ;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future<RegisterResponse> register(String name, String email, String password, String rePassword, String phone) {
    return remoteDataSource.register(name, email, password, rePassword, phone);
  }

}
AuthRepositoryContract injectAuthRepository(){
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}