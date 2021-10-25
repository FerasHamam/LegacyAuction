import 'package:flutter/cupertino.dart';
//product
import './Product.dart';

class Products with ChangeNotifier {
  List<Product> products = [];

  void addProduct(
      String name, double startingPrice, double leastAmtBid, String userId) {
    //database code
    products.add(
      new Product(
          name: name,
          userId: userId,
          startingPrice: startingPrice,
          leastAmtBid: leastAmtBid,
          postedin: DateTime.now(),
          expiryDate: DateTime.now().add(Duration(days: 7))),
    );
    notifyListeners();
  }

  List<Product> getProducts() {
    return [...products];
  }

  void initProducts() {
    //database code
    notifyListeners();
  }
}
