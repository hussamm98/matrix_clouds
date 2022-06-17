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
            ? const Center(child: Text("No Data "))
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: height * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)
                          ),
                          elevation: 4.0,
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
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        "${cubit.myCart[index].latestCars!.price!} L.E",
                                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.grey[200],
                                ),
                                child: Row(
                                  children: [
                                    FloatingActionButton(
                                      onPressed: () {

                                      },
                                      child: Icon(Icons.add),
                                      mini: true,
                                    ),
                                    Text(
                                     "${cubit.myCart[index].count}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    FloatingActionButton(
                                      onPressed: () {},
                                      child: Icon(Icons.remove),
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
                          endIndent: width * 0.05,
                        ),
                        itemCount: cubit.myCart.length,
                      ),
                    ),
                  ),
                  Text(
                    "Total is cubit.totalPrice() LE",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  defaultButton(
                    function: () => AwesomeDialog(
                      context: context,
                      dialogType: DialogType.SUCCES,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Successfully!',
                      desc: 'Thank you for shopping with us.'
                          ' Your payment for cubit.totalPrice()} LE has been verified.',
                      btnOkOnPress: () {},
                    )..show(),
                    icon: Icons.monetization_on_rounded,
                    text: "Check Out",
                  )
                ],
              );
      },
    );
  }
}
