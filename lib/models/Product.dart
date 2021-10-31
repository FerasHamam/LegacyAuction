import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  late String prodId;
  String name;
  String desc;
  String imageURL;
  String startingPrice;
  String bidPrice;
  String userEmail;
  String highestbidder;
  DateTime postedin;
  DateTime expiryDate;
  Product(
      {required this.name,
      required this.desc,
      required this.imageURL,
      required this.startingPrice,
      required this.bidPrice,
      required this.userEmail,
      required this.highestbidder,
      required this.postedin,
      required this.expiryDate});
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'desc': desc,
        'imageURL': imageURL,
        'postedin': postedin.toString(),
        'expiryDate': expiryDate.toString(),
        'userEmail': userEmail,
        'highestbidder': highestbidder,
        'startingPrice': startingPrice.toString(),
        'bidPrice': bidPrice.toString(),
      };

  Product.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'],
        desc = json['desc'],
        imageURL = json['imageURL'],
        startingPrice = json['startingPrice'],
        bidPrice = json['bidPrice'],
        userEmail = json['userEmail'],
        highestbidder = json['highestbidder'],
        postedin = DateTime.parse(json['postedin'] as String),
        expiryDate = DateTime.parse(json['expiryDate'] as String);

  void setProduct() {
    notifyListeners();
  }

  void setProdId(String prodId) {
    this.prodId = prodId;
  }

  void setProdBidPrice(String bidPrice) {
    this.bidPrice = bidPrice;
  }

  void setProdHigherBider(String highestbidder) {
    this.highestbidder = highestbidder;
  }

  String getProdId() {
    return this.prodId;
  }
}
