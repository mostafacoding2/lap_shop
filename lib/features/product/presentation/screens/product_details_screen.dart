import 'package:ultra_shop/core/utils/app_color.dart';
import 'package:ultra_shop/features/product/data/manger/cubits/product_cubit.dart';
import 'package:ultra_shop/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultra_shop/features/product/presentation/widgets/product_details_body.dart';
import '../widgets/custom_loading_details.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen(
      {super.key,
      this.comming,
      required this.id,
      this.productModel,
      this.lenghtList});
  final int id;
  final int? lenghtList;
  final List<ProductModel>? productModel;
  final String? comming;

 //
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return BlocProvider(
      create: (context) => ProductCubit()..getProductId(id: id),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          var cubit=ProductCubit.get(context);
          var data = cubit.getProductModel;
          return SafeArea(
            child: Scaffold(backgroundColor: AppColors.myDark,
                body: data!=null
                    ? Hero(
                        tag: id,
                        child: ProductDetailsBody(
                            cubit:cubit,
                            data: data!, id: id),
                      )
                    : Center(
                        child: CustomloadingDetails(),
                      )),
          );
        },
      ),
    );
  }
}
