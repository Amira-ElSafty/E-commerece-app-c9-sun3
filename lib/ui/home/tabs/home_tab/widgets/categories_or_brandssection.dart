import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_c9_sun/domain/entities/CategoryEntity.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/home/tabs/home_tab/widgets/category_or_brand_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesOrBrandsSection extends StatelessWidget {
  List<CategoryOrBrandEntity> list;
  CategoriesOrBrandsSection({required this.list});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: GridView.builder(
          itemCount: list.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoryOrBrandItem(
              model: list[index],
            );
          },
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16.w,
            crossAxisSpacing: 16.h,
          )),
    );
  }
}
