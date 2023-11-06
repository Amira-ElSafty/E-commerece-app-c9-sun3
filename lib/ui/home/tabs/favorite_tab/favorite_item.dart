import 'package:flutter/material.dart';
import 'package:flutter_app_e_commerece_c9_sun/ui/utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteItem extends StatelessWidget {
  String title;
  String imagepath;
  int newprice;
  int oldprice;
  String color;

  FavoriteItem(
      {required this.title,
      required this.imagepath,
      required this.color,
      required this.newprice,
      required this.oldprice});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1.w, color: AppColors.lightGreyColor)),
      width: 398.w,
      height: 145.h,
      child: Row(children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: 145.h,
          width: 130.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Image.asset(imagepath, fit: BoxFit.fill),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold)),
                      InkWell(
                        onTap: () {
                          //logic here
                        },
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.primaryColor,
                            size: 20.w,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: Icon(
                          Icons.circle,
                          color: AppColors.redColor,
                          size: 15.w,
                        ),
                      ),
                      Text(color,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: AppColors.blueGreyColor)),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 14.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('EGP $newprice',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColors.primaryColor)),
                        SizedBox(
                          width: 6.w,
                        ),
                        Expanded(
                          child: Container(
                            // height: 40.h,
                            // width: 110.w,
                            // padding: EdgeInsets.only(
                            //   left: 12.w,
                            //   top: 4.h,
                            // ),

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Theme.of(context).primaryColor),
                            child: Text('Add to Cart',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: AppColors.whiteColor)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
