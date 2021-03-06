import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
//models
import './Product.dart';
import './User.dart';

class FirebaseProvider with ChangeNotifier {
  void addProduct(
      String name, String desc, String startingPrice, String imageURL) {
    final Product newProduct = new Product(
      name: name,
      desc: desc,
      imageURL: imageURL,
      userEmail: UserData.Email,
      highestbidder: 'none',
      startingPrice: startingPrice,
      bidPrice: startingPrice,
      postedin: DateTime.now(),
      expiryDate: DateTime.now().add(
        Duration(days: 7),
      ),
    );
    try {
      final _ref = getDatabaseRef();
      _ref.push().set(newProduct.toJson());
    } catch (err) {
      print(err);
      throw (err);
    }
  }

  DatabaseReference getDatabaseRef() {
    return FirebaseDatabase.instance.reference().child('products');
  }
}
