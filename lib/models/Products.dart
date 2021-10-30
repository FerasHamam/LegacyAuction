import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
//models
import './Product.dart';
import './User.dart';

class Products with ChangeNotifier {
  List<Product> products = [];

  void addProduct(String name, String desc, String startingPrice) async {
    final Product newProduct = new Product(
      name: name,
      desc: desc,
      userId: await UserData.getUserId(),
      highestbidder: 'none',
      startingPrice: startingPrice,
      bidPrice: startingPrice,
      postedin: DateTime.now(),
      expiryDate: DateTime.now().add(
        Duration(days: 7),
      ),
    );
    try {
      final _ref = await getDatabaseRef();
      _ref.push().set(newProduct.toJson());
    } catch (err) {
      print(err);
      throw (err);
    }
  }

  List<Product> getProducts() {
    return [...products];
  }

  DatabaseReference getDatabaseRef() {
    return FirebaseDatabase.instance.reference().child('products');
  }
}
