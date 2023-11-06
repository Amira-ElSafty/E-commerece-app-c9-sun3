import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/api_constants.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/Api/failures.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/model/AddToCartResponseDto.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/model/request/LoginRequest.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/model/request/RegisterRequest.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/model/response/CategoryOrBrandResponseDto.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/model/response/LoginResponse.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/model/response/ProductResponseDto.dart';
import 'package:flutter_app_e_commerece_c9_sun/data/model/response/RegisterResponse.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/utils/shared_preference_utils.dart';
import 'package:http/http.dart' as http;
class ApiManager{
  ApiManager._();
  static ApiManager? _instance ;
  static ApiManager getInstance(){
    _instance ??= ApiManager._();
    return _instance!;
  }
/*
https://ecommerce.routemisr.com/api/v1/auth/signup
 */
   Future<Either<Failures,RegisterResponse>> register(String name,String email, String password , String rePassword ,
      String phone)async{
     ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.mobile ||
         connectivityResult == ConnectivityResult.wifi) {
       // I am connected to a mobile network.
       Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.registerApi);
       var requestBody = RegisterRequest(
           name: name,
           email: email,
           password:password ,
           phone:phone ,
           rePassword: rePassword
       );
       var response = await http.post(url,body: requestBody.toJson());
       var registerResponse =  RegisterResponse.fromJson(jsonDecode(response.body));
       if(response.statusCode >= 200 && response.statusCode < 300){
         return Right(registerResponse);
       }else{
         return Left(Failures(errorMessage: registerResponse.error != null ?
             registerResponse.error!.msg
             :registerResponse.message
         ));
       }
     }else{
       /// no internet connection
       return Left(Failures(errorMessage: 'Please Check internet connection'));
     }

  }
  Future<Either<Failures,LoginResponse>> login(String email, String password)async{
     final connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.mobile ||
         connectivityResult == ConnectivityResult.wifi) {
       // I am connected to a mobile network.
       Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.loginApi);
       var requestBody = LoginRequest(
           email: email,
           password:password ,
       );
       var response = await http.post(url,body: requestBody.toJson());
       var loginResponse =  LoginResponse.fromJson(jsonDecode(response.body));
       if(response.statusCode == 200 && response.statusCode < 300){
         return Right(loginResponse);
       }else{
         return Left(Failures(errorMessage: loginResponse.message));
       }
     }else{
       /// no internet connection
       return Left(Failures(errorMessage: 'Please Check internet connection'));
     }

  }
  Future<Either<Failures,CategoryOrBrandResponseDto>> getCategories()async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.getAllCategoriesApi);
      var response = await http.get(url);
      var categoryResponse =  CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        return Right(categoryResponse);
      }else{
        return Left(ServerError(errorMessage: categoryResponse.message));
      }
    }else{
      /// no internet connection
      return Left(NetworkError(errorMessage: 'Please Check internet connection'));
    }

  }

  Future<Either<Failures,CategoryOrBrandResponseDto>> getBrands()async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.getAllBrandsApi);
      var response = await http.get(url);
      var brandResponse =  CategoryOrBrandResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        return Right(brandResponse);
      }else{
        return Left(ServerError(errorMessage: brandResponse.message));
      }
    }else{
      /// no internet connection
      return Left(NetworkError(errorMessage: 'Please Check internet connection'));
    }

  }

  Future<Either<Failures,ProductResponseDto>> getProducts()async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.getAllProductsApi);
      var response = await http.get(url);
      var productResponse =  ProductResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        return Right(productResponse);
      }else{
        return Left(ServerError(errorMessage: productResponse.message));
      }
    }else{
      /// no internet connection
      return Left(NetworkError(errorMessage: 'Please Check internet connection'));
    }

  }

  Future<Either<Failures,AddToCartResponseDto>> addToCart(String productId)async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      var token =  SharedPreferenceUtils.getData('Token');
      Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.addToCartApi);
      var response = await http.post(url,body: {
        'productId':productId
      },
        headers: {
        'token': token!
        }
      );
      var addToCartResponse =  AddToCartResponseDto.fromJson(jsonDecode(response.body));
      if(response.statusCode >= 200 && response.statusCode < 300){
        return Right(addToCartResponse);
      }else if(response.statusCode == 401){
        return Left(Failures(errorMessage: addToCartResponse.message));
      }
      else{
        return Left(ServerError(errorMessage: addToCartResponse.message));
      }
    }else{
      /// no internet connection
      return Left(NetworkError(errorMessage: 'Please Check internet connection'));
    }

  }
}