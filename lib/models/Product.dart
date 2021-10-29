class Product {
  String name;
  String startingPrice;
  String userId;
  DateTime postedin;
  DateTime expiryDate;
  Product(
      {required this.name,
      required this.startingPrice,
      required this.userId,
      required this.postedin,
      required this.expiryDate});
  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'name': name,
        'postedin': postedin.toString(),
        'expiryDate': expiryDate.toString(),
        'userId': userId,
        'startingPrice': startingPrice.toString(),
      };
  Product.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'],
        startingPrice = json['startingPrice'],
        userId = json['userId'],
        postedin = DateTime.parse(json['postedin'] as String),
        expiryDate = DateTime.parse(json['expiryDate'] as String);
}
