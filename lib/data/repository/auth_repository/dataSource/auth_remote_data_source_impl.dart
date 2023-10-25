import 'package:flutter_app_e_commerece_c9_sun/data/Api/api_manager.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/model/response/RegisterResponse.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/dataSource/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManager apiManager ;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<RegisterResponse> register(String name, String email, String password, String rePassword, String phone)
  async{
   var response = await apiManager.register(name, email, password, rePassword, phone);
   return response ;
  }

}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}