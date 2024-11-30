import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/core/utils/app_string.dart';
import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/core/utils/images_paths.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_appBar_home_view.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/custom_carousel_slider.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/screens/shops_screens.dart';
import 'package:ultra_shop/features/ShopProducts/presentation/widgets/custom_shops_view.dart';
import 'package:ultra_shop/features/Home/presentation/widgets/header.dart';
import 'package:ultra_shop/features/category/presentation/screens/Categories_screen.dart';
import 'package:ultra_shop/features/category/presentation/widgets/custom_category_view.dart';
import 'package:ultra_shop/features/product/data/manger/cubits/product_cubit.dart';
import 'package:ultra_shop/features/product/presentation/screens/products_screen.dart';
import 'package:ultra_shop/features/product/presentation/widgets/custom_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  ProductCubit cubit = ProductCubit();
  @override
  void initState() {

    super.initState();
    _fetchProductDetails();
  }

  void _fetchProductDetails() {
    cubit.getAllWorkspacesbySortReview().then((_) {
      setState(() {});
    });
    cubit.getAllProduct().then((_) {
      setState(() {});
    });

    }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarHome(),

        CustomCarouselSlider(),
        SizedBox(height: 10.h,),
        Divider(color: AppColors.myDarkGrey2,),

        HeaderTitle(
          onPressed: () {
            navigateTo(context, CategoriesScreen());
          },
          title: 'Categories',
        ),

        Divider(color: AppColors.myDarkGrey2,),



 CustomCategoryView(),
        Divider(color: AppColors.myDarkGrey2,),

        HeaderTitle(
          onPressed: () {
            navigateTo(context, ProductsScreen());
          },
          title: 'Products',
        ),Divider(color: AppColors.myDarkGrey2,),

        SizedBox(height: 10.h,),

        CustomProductView(),
        Divider(color: AppColors.myDarkGrey2,),


        HeaderTitle(arrow:false,
          onPressed: () {
            navigateTo(context, ProductsScreen());
          },
          title: 'Best Seller',
        ),Divider(color: AppColors.myDarkGrey2,),

       SizedBox(
          height: 10.h,
        ),
        BestSeller(),
        Divider(color: AppColors.myDarkGrey2,),

        SizedBox(height: 10.h,),
      ],
    );
  }
}
