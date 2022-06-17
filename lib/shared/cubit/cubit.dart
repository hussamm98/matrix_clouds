import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix_clouds/model/item/item.dart';
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
    int index;
    if (myCart.isEmpty) {
      myCart.add(Item(1, latestCars));
    } else {
      index = myCart.indexWhere((element) => element.latestCars == latestCars);
      if (index != -1) {
        print(index);
        myCart[index].count = myCart[index].count! + 1;
      } else {
        print("add");
        myCart.add(Item(1, latestCars));
      }
    }
  }

  void add(int index) {
    myCart[index].count = myCart[index].count! + 1;
    emit(AddProductState());
  }


  void minus(int index) {
    if (myCart[index].count! > 1) {
      myCart[index].count = myCart[index].count! - 1;
    } else {
      myCart.removeAt(index);
    }
    emit(MinusProductState());
  }


  int totalPrice() {
    int sum = 0;
    for (var item in myCart) {
      sum += (item.latestCars!.price! * item.count!);
    }
    return sum;
  }
}
