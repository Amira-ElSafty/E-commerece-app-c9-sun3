import 'package:flutter_app_e_commerece_c9_sun/domain/entities/ProductResponseEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/add_to_cart_use_case.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/useCase/get_all_products_use_case.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/tabs/product_tab/cubit/product_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListViewModel extends Cubit<ProductListTabStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase ;
  ProductListViewModel({required this.getAllProductsUseCase,
  required this.addToCartUseCase})
      : super(ProductListTabInitialState());
  List<ProductEntity> productsList = [];
  int numOfCartItems = 0 ;

  void getProducts() async {
    emit(ProductListTabLoadingState(loadingMessage: 'Loading...'));
    var either = await getAllProductsUseCase.invoke();
    either.fold((l) {
      emit(ProductListTabErrorState(errors: l));
    }, (response) {
      productsList = response.data ?? [];
      emit(ProductListTabSuccessState(responseEntity: response));
    });
  }
 /// object bloc
  static ProductListViewModel get(context) => BlocProvider.of(context);

  void addToCart(String productId)async{
    emit(AddToCartLoadingStates(loadingMessage: 'Loading...'));
    var either = await addToCartUseCase.invoke(productId);
    either.fold((l) {
      emit(AddToCartErrorStates(errors: l));
    }, (response) {
      numOfCartItems = response.numOfCartItems ?? 0 ;
      print('Num of cart items : $numOfCartItems');
      emit(AddToCartSuccessStates(responseEntity: response));
    });
  }
}
