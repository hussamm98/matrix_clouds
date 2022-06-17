import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix_clouds/model/item.dart';
import 'package:matrix_clouds/modules/cart/cart_screen.dart';
import 'package:matrix_clouds/modules/home/home_screen.dart';
import 'package:matrix_clouds/shared/cubit/states.dart';

import '../../model/products/products_model.dart';
import '../../network/dio.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit getCubit(context) => BlocProvider.of(context);

  int currentIndex = 0;
  int sliderIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    const CartScreen(),
  ];

  List<String> titles = [
    "Home",
    "Cart",
  ];

  void changeScreen(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBar());
  }

  void changeSlider(int index) {
    sliderIndex = index;
    emit(ChangeSliderIndex());
  }

  ProductData? productData;

  void getData() {
    emit(GetDataLoadingState());
    DioHelper.getDio(url: 'home').then((value) {
      print(value?.data);
      productData = ProductData.fromJson(value?.data);
      emit(GetDataSuccessState());
    }).catchError((error) {
      print("Error = ${error.toString()}");
      emit(GetDataErrorState(error));
    });
  }

  // List<LatestCars> addToCart = [];
  // void addCart(LatestCars latestCars){
  //   addToCart.add(latestCars);
  // }

  /* int totalPrice(){
    int sum=0;
    for(var item in addToCart){
      sum+=item.price!;
    }
    return sum;
  }
*/

  List<Item> myCart = [];

  void addMyCart(LatestCars latestCars) {
    int count = 0;
    if (myCart.isEmpty) {
      myCart.add(Item(1, latestCars));
    } else {
      for (var element in myCart) {
        if (element.latestCars == latestCars) {
          //  element.count = element.count! + 1;
          count = element.count! + 1;
          print("count = $count");
        } else {
          myCart.add(Item(1, latestCars));
          print("Added");
        }
      }
      if (count != 0) {
        int index =
            myCart.indexWhere((element) => element.latestCars == latestCars);
        myCart[index] = Item(count, latestCars);
      } else {}
    }
  }
}
