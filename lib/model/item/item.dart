import 'package:matrix_clouds/model/products/products_model.dart';

class Item {
  int? count;
  LatestCars? latestCars;

  Item(int count, LatestCars latestCars) {
    this.count = count;
    this.latestCars = latestCars;                                                     
  }

  set setCount(int count) {
    count += count;
  }
}
