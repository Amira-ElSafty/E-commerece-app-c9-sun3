import 'package:flutter_app_e_commerece_c9_sun/domain/entities/CategoryEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/get_all_brands_use_case.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/get_all_categories_use_case.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/get_all_products_use_case.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/tabs/home_tab/cubit/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabViewModel extends Cubit<HomeTabStates>{
  GetAllCategoryUseCase getAllCategoryUseCase ;
  GetAllBrandsUseCase getAllBrandsUseCase;
  HomeTabViewModel({required this.getAllCategoryUseCase,
    required this.getAllBrandsUseCase}):super(HomeTabInitialState());

  List<CategoryOrBrandEntity> categoriesList = [] ;
  List<CategoryOrBrandEntity> brandsList = [] ;

  void getCategories()async{
    emit(HomeTabCategoryLoadingState(loadingMessage: 'Loading...'));
    var either = await getAllCategoryUseCase.invoke();
    either.fold((l) {
      emit(HomeTabCategoryErrorState(errorMessage: l.errorMessage));
    },
            (response) {
      categoriesList = response.data ?? [];
      if(brandsList.isNotEmpty){
        emit(HomeTabCategorySuccessState(responseEntity: response));
      }
            }
    );
  }

  void getBrands()async{
    emit(HomeTabBrandLoadingState(loadingMessage: 'Loading...'));
    var either = await getAllBrandsUseCase.invoke();
    either.fold((l) {
      emit(HomeTabBrandErrorState(errorMessage: l.errorMessage));
    },
            (response) {
      brandsList = response.data ?? [];
      if(categoriesList.isNotEmpty){
        emit(HomeTabBrandSuccessState(responseEntity: response));
      }
            }
    );
  }

}