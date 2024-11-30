import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_shop/core/utils/constants.dart';

import '../../../../core/Shimmers/offers.dart';
import '../../../product/data/manger/cubits/product_cubit.dart';
import '../../../product/presentation/screens/product_details_screen.dart';
import '../../../product/presentation/widgets/custom_product.dart';
import 'custom_discount.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: 200.h,
        child: CarouselSlider(
            items: banners
                .map((e) => Image.asset(
                      e,
                      fit: BoxFit.fill,
                      width: MediaQuery.sizeOf(context).width,
                    ))
                .toList(),
            options: CarouselOptions(
              aspectRatio: 0.9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            )));
  }
}

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225.h,
      child: BlocProvider(
        create: (context) => ProductCubit()..getAllWorkspacesbySortReview(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return state is GetAllProductLoadingState
                ? OffersShimmers()
                : ListView.builder(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        ProductCubit.get(context).WorkspacesbySortReview.length>3?3:ProductCubit.get(context).WorkspacesbySortReview.length,
                    itemBuilder: (context, index) {
                      var cubit = ProductCubit.get(context)
                          .WorkspacesbySortReview[index];

                      return CustomProduct(
                        onTap: () {
                          navigateTo(
                              context,
                              ProductDetailsScreen(
                                comming: "products",
                                id: cubit.id!,
                              ));
                        },
                        price: "${cubit.priceProd}",
                        description: cubit.descrip!,
                        urlImage: cubit.imageUrls![0],
                        nameDevice: cubit.itemName!,
                        rating: cubit.averageRate == 0 ? 0 : cubit.averageRate!,
                      );
                    });

            Text("not found ");
          },
        ),
      ),
    );
  }
}
