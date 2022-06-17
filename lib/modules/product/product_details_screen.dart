import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:like_button/like_button.dart';
import 'package:matrix_clouds/model/products/products_model.dart';
import 'package:matrix_clouds/shared/cubit/cubit.dart';
import 'package:matrix_clouds/shared/cubit/states.dart';
import '../../shared/component/shared_component.dart';

class ProductDetailsScreen extends StatelessWidget {
   ProductDetailsScreen(this.latestCars, {Key? key}) : super(key: key);
   LatestCars ?latestCars;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.35,
                decoration:  BoxDecoration(
                  image: DecorationImage(image: NetworkImage(latestCars!.image!)),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24.0),
                    bottomRight: Radius.circular(24.0),
                  ),),
              ),
              Text(latestCars!.title!,style: TextStyle(fontSize: 16),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Price: ${latestCars!.price} L.E",style: TextStyle(fontSize: 18),), LikeButton(),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(12.0),
                        color: Colors.grey[200]),
                    child: RatingBar.builder(
                      itemSize: 12,
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(
                          horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ),
                ],
              ),
              Container(
                height: height,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius:const BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    )
                ),
                child: const Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      child: Text("Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                        style: TextStyle(fontSize: 18),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
