import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/features/product/presentation/screens/update_product_screen.dart';
import 'package:ultra_shop/features/product/presentation/widgets/custom_item_delete.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ultra_shop/core/Theme/light_theme.dart';
import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Cart/data/cubit/cart_cubit.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_title_and_arrow.dart';
import 'package:ultra_shop/features/product/data/manger/cubits/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/models/product_model.dart';
import '../screens/all_reviews_product.dart';
import '../screens/review_screen.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody(
      {super.key,required this.cubit,
      required this.data,
      this.comming,
      required this.id,
      this.lenghtList});
  final int id;
  final int? lenghtList;
  final ProductModel data;
  final String? comming;
final   ProductCubit cubit;

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  var controller = PageController();
  int selectedFieldCount = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarTitleArrow(
            arrow_back: true,
            icondata: PopupMenuButton<String>(
                icon: Icon(
                  Icons.menu,
                  color: AppColors.myWhite,
                ),
                onSelected: (String choice) {
                  if (choice == 'Delete') {
                    showDialog(
                        barrierColor: const Color.fromRGBO(0, 100, 102, 0.2),
                        context: context,
                        builder: (BuildContext context) {
                          return ItemDelete(
                            id: widget.data.id!,
                            comming: widget.comming,
                            title: "Do you want to delete product ?",
                          );
                        });
                  } else if (choice == 'Update') {
                    navigateTo(
                        context,
                        BlocProvider(
                          create: (context) => ProductCubit(),
                          child: UpDateProductScreen(
                              descrip: widget.data.descrip!,
                              solditemsProd: widget.data.solditemsProd!,
                              quantityProd: widget.data.quantityProd,
                              itemName: widget.data.itemName,
                              priceProd: widget.data.priceProd,
                              id: widget.data.id,
                              categoryName: widget.data.categoryName!,
                              nameShop: widget.data.shop!.name!),
                        ));
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'Delete',
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete,
                            color: AppColors.myRed,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'delete',
                            style: lightTheme.textTheme.labelSmall!.apply(
                              fontSizeFactor: 1.sp,
                              color: AppColors.myRed,
                            ),
                          )
                        ],
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'Update',
                      child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.edit,
                            color: AppColors.myNavy,
                            size: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'update',
                            style: lightTheme.textTheme.labelSmall!.apply(
                              fontSizeFactor: 1.sp,
                              color: AppColors.myNavy,
                            ),
                          )
                        ],
                      ),
                    )
                  ];
                }),
            isShowed: role == AppString.admin || role == AppString.seller
                ? true
                : false,
            title: "product details",
            onpressed: () {
              Navigator.pop(context);
            }),
        SizedBox(
          height: 150.h,
          width: double.infinity,
          child: Stack(
            children: [
              PageView.builder(
                  controller: controller,
                  itemCount: widget.data.imageUrls!.length,
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(width: 200,height: 140.h,fit: BoxFit.contain,
                      imageUrl: widget.data.imageUrls![index],
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error, color: AppColors.myRed),
                    );
                  }),
              Positioned(
                  left: 20,
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidStar,
                        color: AppColors.myYellow,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "${widget.data.averageRate}",
                        textAlign: TextAlign.start,
                        style: lightTheme.textTheme.labelLarge!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SmoothPageIndicator(
              controller: controller,
              count: widget.data.imageUrls!.length,
              effect: WormEffect(
                  dotColor: AppColors.myGrey5,
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: AppColors.primaryColor)),
        ),
        SizedBox(
          height: 6.h,
        ),
        Divider(
          color: AppColors.myDarkGrey2,
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.0.r,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(maxLines: 1,
                      widget.data.itemName!,
                      textAlign: TextAlign.center,
                      style: lightTheme.textTheme.displaySmall!.apply(
                        fontSizeFactor: 1.sp,
                        color: AppColors.myBlue,
                      ),
                    ),
                    Spacer(),
                    (role == AppString.seller || role == AppString.admin||token=='')?SizedBox() : Row(
                      children: [
                        GestureDetector(
                          onTap:(){

                          widget.cubit.addQuantity(widget.data.quantityProd!);},
                          child: Container(
                              margin: EdgeInsets.all(8.h),
                              padding: EdgeInsets.all(8.h),
                              child: Icon(
                                Icons.add,
                                color: AppColors.myWhite,
                                size: 25.h,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(12.r),
                                  color: AppColors.primaryColor)),
                        ),
                        Text(
                          widget.cubit.currentQuantity.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .apply(
                            fontSizeFactor: 1.sp,
                            color: AppColors.myWhite,
                          )
                              .copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        GestureDetector(onTap:(){widget.cubit.removeQuantity();},
                          child: Container(
                              margin: EdgeInsets.all(8.h),
                              padding: EdgeInsets.only(
                                  bottom: 10.h,
                                  right: 10.w,
                                  left: 10.w,
                                  top: 5.h),
                              child: Icon(
                                Icons.minimize_rounded,
                                color: AppColors.myWhite,
                                size: 25.h,
                              ),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(12.r),
                                  color: AppColors.primaryColor)),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  color: AppColors.myDarkGrey2,
                ),
                Padding(
                  padding: EdgeInsets.all(6.0.h),
                  child: Row(
                    children: [
                      Text(
                        "quantity:",
                        style: lightTheme.textTheme.displaySmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "${widget.data.quantityProd!}",
                        style: lightTheme.textTheme.displaySmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myCrimson,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                (role == AppString.seller || role == AppString.admin)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            color: AppColors.myDarkGrey2,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Row(
                              children: [
                                Text(
                                  'category: ',
                                  style:
                                      lightTheme.textTheme.displaySmall!.apply(
                                    fontSizeFactor: 1.sp,
                                    color: AppColors.myNavy,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  widget.data.categoryName!,
                                  style:
                                      lightTheme.textTheme.displaySmall!.apply(
                                    fontSizeFactor: 1.sp,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Column(
                            children: [
                              Divider(
                                color: AppColors.myDarkGrey2,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "  solditemsProduct:",
                                    style: lightTheme.textTheme.displaySmall!
                                        .apply(
                                      fontSizeFactor: 1.sp,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "${widget.data.solditemsProd!}",
                                    style: lightTheme.textTheme.displaySmall!
                                        .apply(
                                      fontSizeFactor: 1.sp,
                                      color: AppColors.myCrimson,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: AppColors.myDarkGrey2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      "shop:",
                                      style: lightTheme.textTheme.displaySmall!
                                          .apply(
                                        fontSizeFactor: 1.sp,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "${widget.data.shop!.name!}",
                                      style: lightTheme.textTheme.displaySmall!
                                          .apply(
                                        fontSizeFactor: 1.sp,
                                        color: Colors.purpleAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    : SizedBox(),
                Divider(
                  color: AppColors.myDarkGrey2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Text(
                        "price:",
                        style: lightTheme.textTheme.displaySmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        r" $" " ${widget.data.priceProd!}",
                        style: lightTheme.textTheme.displaySmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppColors.myDarkGrey2,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Text(
                      " description:",
                      textAlign: TextAlign.start,
                      style: lightTheme.textTheme.displaySmall!.apply(
                        overflow: TextOverflow.ellipsis,
                        fontSizeFactor: 1.sp,
                        color: AppColors.myDarkRed,
                      ),
                    ),
                      Expanded(
                        child: Text(
                          " ${widget.data.descrip!} ",
                          maxLines: 5,
                          textAlign: TextAlign.start,
                          style: lightTheme.textTheme.displaySmall!.apply(
                            overflow: TextOverflow.ellipsis,
                            fontSizeFactor: 1.sp,
                            color: AppColors.myWhite,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: AppColors.myDarkGrey2,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5.0.h),
            child: Column(
              children: [
                SizedBox(
                    height: 25.h,
                    child: Row(children: [
                      Spacer(),
                      Text(
                        "reviews",
                        style: lightTheme.textTheme.displaySmall!.apply(
                          fontSizeFactor: 1.sp,
                          color: AppColors.myGreen,
                        ),
                      ),
                      Spacer(
                        flex: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(context, AllReviewsProduct(
                         id:   widget.data.id!,
                            reviews: widget.data.revDto.length, revDtoModel:widget.data.revDto ,));
                        },
                        child: Text(
                          " all reviews",
                          style: lightTheme.textTheme.displaySmall!.apply(
                            fontSizeFactor: 1.sp,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      Spacer(),
                    ])),
                SizedBox(height: 5.h,),
                widget.data.revDto.length == 0
                    ? SizedBox()
                    : Expanded(
                        child: Column(
                        children: List.generate(
                            widget.data.revDto.length > 1
                                ? 1
                                : widget.data.revDto.length, (index) {
                          return Container(
                            margin: EdgeInsets.only(right: 10.w, bottom: 5.h),
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(12.r),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(191, 214, 215, 0.1),
                                    offset: Offset(1, 1),
                                    spreadRadius: 0,
                                    blurRadius: 4)
                              ],
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 30.h,
                                  child:
                                      Image.asset("assets/images/profile.jpeg"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    widget.data.revDto[index].comment!,
                                    style:
                                        lightTheme.textTheme.labelMedium!.apply(
                                      fontSizeFactor: 1.sp,
                                      color: AppColors.myWhite,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.myYellow,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      "${widget.data.revDto[index].rating!}",
                                      textAlign: TextAlign.start,
                                      style: lightTheme.textTheme.labelSmall!
                                          .apply(
                                        fontSizeFactor: 1.sp,
                                        color: AppColors.myDark,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                      )),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        (role == AppString.seller || role == AppString.admin|| token=='')
            ? SizedBox(
                height: 0,
              )
            : Padding(
              padding: EdgeInsets.only(right: 8.0.r, left: 10.r),
              child: BlocProvider(
                create: (context) => CartCubit(),
                child: BlocConsumer<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state is AddProductToCartSuccessState) {
                      flutterToast(
                          message: "Add to Cart Success ", success: true);
                    }
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return GestureDetector(onTap: (){ {
                      CartCubit.get(context).addProductToCart(
                          quantity: widget.cubit.currentQuantity,
                          id: widget.data.id!);
                    }},
                      child: Container(width: 160.w,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        margin: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: AppColors.myWhite,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.primaryColor.withOpacity(0.5),
                                  offset: Offset(1, 1),
                                  spreadRadius: 0,
                                  blurRadius: 4)
                            ]),
                        child: Row(
                          children: [


                            Text(
                              "Add to Cart",
                              textAlign: TextAlign.start,
                              style: lightTheme.textTheme.labelSmall!
                                  .apply(
                                fontSizeFactor: 1.sp,
                                color: AppColors.primaryColor,
                              ),
                            ),Spacer(),
                            Icon(
                                  Icons.shopping_cart,
                                  size: 35,
                                  color: AppColors.myGreen,
                                ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
      ],
    );
  }
}

