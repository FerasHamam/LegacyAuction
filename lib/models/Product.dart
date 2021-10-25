// import './User.dart';

class Product {
  String name;
  double startingPrice;
  String userId;
  double leastAmtBid;
  DateTime postedin;
  DateTime expiryDate;
  Product(
      {required this.name,
      required this.startingPrice,
      required this.userId,
      required this.leastAmtBid,
      required this.postedin,
      required this.expiryDate});
}
