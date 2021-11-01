import 'package:ai_project/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//models
import '../../models/Products.dart';
import '../../models/Product.dart';
//widgets
import './ProductWidget.dart';
import './ElevationWidget.dart';

class ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height,
      width: deviceSize.width,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            child: ElevationWidget(),
          ),
          Container(
            margin: EdgeInsets.only(top: 100.h),
            child: StreamBuilder(
              stream: Provider.of<FirebaseProvider>(context, listen: false)
                  .getDatabaseRef()
                  .onValue,
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                List<Product> products = [];
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(
                    child: CircularProgressIndicator(
                      color: kPrimaryColor,
                    ),
                  );
                else if (snapshot.hasData) {
                  Map<dynamic, dynamic> value =
                      snapshot.data.snapshot.value as Map<dynamic, dynamic>;
                  int index = 0;
                  value.forEach((key, value) {
                    final product =
                        Product.fromJson(value as Map<dynamic, dynamic>);
                    if (product.expiryDate
                            .difference(DateTime.now())
                            .inMinutes <
                        0) {
                      Provider.of<FirebaseProvider>(context, listen: false)
                          .getDatabaseRef()
                          .child(key)
                          .remove();
                    } else {
                      products.add(product);
                      products[index].setProdId(key);
                      index++;
                    }
                  });
                }
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) =>
                      ProductWidget(products[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
