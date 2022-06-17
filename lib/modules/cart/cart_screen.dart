import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matrix_clouds/shared/component/shared_component.dart';
import 'package:matrix_clouds/shared/cubit/cubit.dart';
import 'package:matrix_clouds/shared/cubit/states.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.getCubit(context);
        return cubit.myCart.isEmpty
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/empty-cart.png",
                    scale: 2,
                  ),
                  const Text(
                    "Your cart is empty!",
                    style: TextStyle(fontSize: 18),
                  ),
                  const Text(
                    "but it doesn't have to be.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ))
            : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) => Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            elevation: 8.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: height * 0.18,
                                  width: width * 0.3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          cubit.myCart[index].latestCars!.image!),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.myCart[index].latestCars!.title!,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          "${cubit.myCart[index].latestCars!.price!} L.E",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: width*0.24,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: Colors.grey[200],
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      FloatingActionButton(
                                        onPressed: () {
                                          cubit.add(index);
                                        },
                                        child: const Icon(Icons.add),
                                        mini: true,
                                      ),
                                      Text(
                                        "${cubit.myCart[index].count}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 20),
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {
                                          cubit.minus(index);
                                        },
                                        child: const Icon(Icons.remove),
                                        mini: true,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          separatorBuilder: (context, index) => Divider(
                            indent: width * 0.05,
                            thickness: 2,
                            endIndent: width * 0.05,
                          ),
                          itemCount: cubit.myCart.length,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Total is ${cubit.totalPrice()} L.E",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                  defaultButton(
                    function: () => AwesomeDialog(
                      context: context,
                      dialogType: DialogType.SUCCES,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Successfully!',
                      desc: 'Thank you for shopping with us.'
                          ' Your payment for ${cubit.totalPrice()} LE has been verified.',
                      btnOkOnPress: () {},
                    )..show(),
                    icon: Icons.monetization_on_rounded,
                    text: "Check Out",
                    width: width*0.7,
                  )
                ],
              );
      },
    );
  }
}
