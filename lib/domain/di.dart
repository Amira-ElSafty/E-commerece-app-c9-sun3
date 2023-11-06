import 'package:flutter_app_e_commerece_c9_sun/data/Api/api_manager.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/repository/auth_repository/dataSource/auth_remote_data_source_impl.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/repository/auth_repository/dataSource/home_remote_data_source_impl.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/repository/auth_repository/repository/home_repository_impl.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/dataSource/auth_remote_data_source.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/dataSource/home_remote_data_source.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/repository/auth_repository_contract.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/repository/auth_repository/repository/home_repository_contract.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/add_to_cart_use_case.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/get_all_brands_use_case.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/get_all_categories_use_case.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/get_all_products_use_case.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/login_use_case.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/register_use_case.dart';

AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

AuthRepositoryContract injectAuthRepository() {
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectAuthRepository());
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepository());
}

GetAllCategoryUseCase injectGetAllCategoryUseCase() {
  return GetAllCategoryUseCase(
      repositoryContract: injectHomeRepositoryContract());
}
GetAllBrandsUseCase injectGetAllBrandsUseCase() {
  return GetAllBrandsUseCase(
      repositoryContract: injectHomeRepositoryContract());
}
GetAllProductsUseCase injectGetAllProductsUseCase() {
  return GetAllProductsUseCase(
      repositoryContract: injectHomeRepositoryContract());
}
AddToCartUseCase injectAddToCartUseCase(){
  return AddToCartUseCase(repositoryContract: injectHomeRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(remoteDataSource: injectHomeRemoteDataSource());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
