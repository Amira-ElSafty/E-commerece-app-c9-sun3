import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/di.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/product_details/product_details_view.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/tabs/home_tab/widgets/custom_search_with_shopping_cart.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/tabs/product_tab/cubit/product_list_states.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/tabs/product_tab/cubit/product_list_view_model.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/tabs/product_tab/widgets/grid_view_card_item.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/utils/my_assets.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/utils/my_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatelessWidget {
  ProductListViewModel viewModel = ProductListViewModel(
      getAllProductsUseCase: injectGetAllProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListViewModel>(
      create: (context) => viewModel..getProducts(),
      child: BlocBuilder<ProductListViewModel, ProductListTabStates>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                    MyAssets.logo,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  const CustomSearchWithShoppingCart(),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is ProductListTabLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            itemCount: viewModel.productsList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2 / 2.4,
                                    crossAxisSpacing: 16.w,
                                    mainAxisSpacing: 16.h),
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      ProductDetailsView.routeName,
                                      arguments: viewModel.productsList[index]);
                                },
                                child: GridViewCardItem(
                                    productEntity:
                                        viewModel.productsList[index]),
                              );
                            },
                          ),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
