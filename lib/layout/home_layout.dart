import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context,state){
          AppCubit cubit = AppCubit.getCubit(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeScreen(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon:Icon(Icons.home),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: "Cart"),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        }
      ),
    );
      }
}
