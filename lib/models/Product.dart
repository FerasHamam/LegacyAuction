class Product {
  late String prodId;
  String name;
  String desc;
  String startingPrice;
  String bidPrice;
  String userId;
  String highestbidder;
  DateTime postedin;
  DateTime expiryDate;
  Product(
      {required this.name,
      required this.desc,
      required this.startingPrice,
      required this.bidPrice,
      required this.userId,
      required this.highestbidder,
      required this.postedin,
      required this.expiryDate});
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'desc': desc,
        'postedin': postedin.toString(),
        'expiryDate': expiryDate.toString(),
        'userId': userId,
        'highestbidder': highestbidder,
        'startingPrice': startingPrice.toString(),
        'bidPrice': bidPrice.toString(),
      };
  Product.fromJson(Map<dynamic, dynamic> json)
      : name = json['name'],
        desc = json['desc'],
        startingPrice = json['startingPrice'],
        bidPrice = json['bidPrice'],
        userId = json['userId'],
        highestbidder = json['highestbidder'],
        postedin = DateTime.parse(json['postedin'] as String),
        expiryDate = DateTime.parse(json['expiryDate'] as String);
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
