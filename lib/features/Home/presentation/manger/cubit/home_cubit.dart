import 'package:ultra_shop/core/utils/constants.dart';
import 'package:ultra_shop/features/Account/presentation/screens/login_screen.dart';
import 'package:ultra_shop/features/Home/presentation/screens/home_screen.dart';
import 'package:ultra_shop/features/Home/presentation/screens/profile_screen.dart';
import 'package:ultra_shop/features/Order/presentation/screens/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Cart/presentation/screens/cart_screen.dart';
import '../../screens/category_nav_screen.dart';
import '../../screens/products_nav_screen.dart';
part 'home_state.dart';
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screen = [
    HomeScreen(),
    role=="Admin" ? ProductsNavScreen(): token==''?LoginScreen():const CartScreen(),
    role=="Admin" ?  CategoryNavScreen():  token==''?LoginScreen(): const OrderScreen(),
    token==''?LoginScreen():const ProfileScreen(),
  ];
  void changeBottom(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
