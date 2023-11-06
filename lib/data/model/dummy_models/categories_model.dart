import 'package:flutter_app_e_commerece_c9_sun/ui/utils/my_assets.dart';

class CategoriesModel {
  final String imgPath;
  final String categoryName;

  CategoriesModel({required this.imgPath, required this.categoryName});
}

final List<CategoriesModel> categories = [
  CategoriesModel(
    imgPath: MyAssets.womenCategory,
    categoryName: "women's\nfashion",
  ),
  CategoriesModel(
    imgPath: MyAssets.menCategory,
    categoryName: "men's\nfashion",
  ),
  CategoriesModel(
    imgPath: MyAssets.electronicsCategory,
    categoryName: "Laptops &\nElectronics",
  ),
  CategoriesModel(
    imgPath: MyAssets.beautyCategory,
    categoryName: "Beauty",
  ),
  CategoriesModel(
    imgPath: MyAssets.headphoneCategory,
    categoryName: "Headphone",
  ),
  CategoriesModel(
    imgPath: MyAssets.skinCareCategory,
    categoryName: "Skincare",
  ),
  CategoriesModel(
    imgPath: MyAssets.skinCareCategory,
    categoryName: "Skincare",
  ),
  CategoriesModel(
    imgPath: MyAssets.skinCareCategory,
    categoryName: "Skincare",
  ),
];
