import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:matrix_clouds/modules/product/product_details_screen.dart';
import 'package:matrix_clouds/shared/cubit/cubit.dart';
import 'package:matrix_clouds/shared/cubit/states.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/component/shared_component.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.getCubit(context);
        return state is GetDataLoadingState
            ? const Center(child: CircularProgressIndicator(),)
            : Column(
              children: [
                Expanded(
                  flex: 1,
                  child: CarouselSlider.builder(
                    itemCount: cubit.productData?.data?.sliders!.length,
                    options: CarouselOptions(
                      height: height,
                      onPageChanged: (index, reason) =>
                          cubit.changeSlider(index),
                      viewportFraction: 1,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      reverse: true,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                    itemBuilder: (context, index, realIndex) {
                      final urlImage =
                          cubit.productData!.data!.sliders![index].image!;
                      return buildImage(urlImage, index);
                    },
                  ),
                ),
                /*   Padding(
            padding: const EdgeInsets.all(8.0),
            child: AnimatedSmoothIndicator(
              activeIndex: cubit.sliderIndex,
              count: cubit.productData!.data!.sliders!.length,
              effect:
              const WormEffect(activeDotColor: Colors.teal, spacing: 2),
            ),
              ),*/
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      gradient:  LinearGradient(
                        colors: [
                          Colors.teal,
                          Colors.tealAccent.withOpacity(0.8),
                          Colors.white,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4,),
                      child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Center(
                            child: Card(
                              elevation: 4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: height * 0.11,
                                      child: Image.network(cubit
                                          .productData!
                                          .data!
                                          .cats![index]
                                          .image!)),
                                  Padding(
                                    padding:
                                        EdgeInsets.all(height * 0.001),
                                    child: Text(
                                      cubit.productData!.data!
                                          .cats![index].title!,
                                      style: const TextStyle(
                                          fontWeight:
                                              FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          itemCount: cubit.productData!.data!.cats!.length),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: width * 0.5,
                                childAspectRatio: 0.6,
                                crossAxisSpacing: 2,
                                mainAxisSpacing: 10),
                        itemCount:
                            cubit.productData?.data?.latestProducts!.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailsScreen(
                                    cubit.productData?.data
                                        ?.latestProducts![index],
                                  ),
                                ),
                              );
                            },
                            child: defaultCard(
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: height * 0.2,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          image: DecorationImage(
                                              image: NetworkImage(cubit
                                                  .productData!
                                                  .data!
                                                  .latestProducts![index]
                                                  .image!))),
                                    ),
                                    Text(
                                      "${cubit.productData!.data!.latestProducts![index].title}",
                                      textDirection: TextDirection.rtl,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                    Text(
                                      "${cubit.productData!.data!.latestProducts![index].price} L.E",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                    defaultButton(
                                      text: 'Add to cart',
                                      icon: Icons.add_shopping_cart_rounded,
                                      function: () {
                                        cubit.addMyCart(cubit.productData!.data!
                                            .latestProducts![index]);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            );
      },
    );
  }
}
