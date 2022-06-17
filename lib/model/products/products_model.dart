class ProductData {
  bool? success;
  Data? data;
  String? message;
  int? code;

  ProductData({this.success, this.data, this.message, this.code});

  ProductData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
  }
}

class Data {
  List<Sliders>? sliders;
  List<LatestCars>? latestSparPart;
  List<LatestCars>? latestCars;
  String? imgOffer;
  List<Cats>? cats;
  List<LatestCars>? latestProducts;
  List<LatestCars>? proMoreArr;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add(Sliders.fromJson(v));
      });
    }
    if (json['latest_spar_part'] != null) {
      latestSparPart = <LatestCars>[];
      json['latest_spar_part'].forEach((v) {
        latestSparPart!.add(LatestCars.fromJson(v));
      });
    }
    if (json['latest_cars'] != null) {
      latestCars = <LatestCars>[];
      json['latest_cars'].forEach((v) {
        latestCars!.add(LatestCars.fromJson(v));
      });
    }
    imgOffer = json['img_offer'];
    if (json['cats'] != null) {
      cats = <Cats>[];
      json['cats'].forEach((v) {
        cats!.add(Cats.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = <LatestCars>[];
      json['latest_products'].forEach((v) {
        latestProducts!.add(LatestCars.fromJson(v));
      });
    }
    if (json['pro_more_arr'] != null) {
      proMoreArr = <LatestCars>[];
      json['pro_more_arr'].forEach((v) {
        proMoreArr!.add(LatestCars.fromJson(v));
      });
    }
  }
}

class Sliders {
  int? id;
  String? title;
  String? text;
  String? link;
  String? image;

  Sliders({this.id, this.title, this.text, this.link, this.image});

  Sliders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
    link = json['link'];
    image = json['image'];
  }
}

class LatestCars {
  int? id;
  int? merchant;
  int? payed;
  String? title;
  int? price;
  bool? favorite;
  String? image;

  LatestCars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    merchant = json['merchant'];
    payed = json['payed'];
    title = json['title'];
    price = json['price'];
    favorite = json['favorite'];
    image = json['image'];
  }
}

class Cats {
  int? id;
  String? title;
  String? image;

  Cats.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
  }
}
