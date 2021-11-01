import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart';
//providers
import 'package:provider/provider.dart';
import 'package:ai_project/models/Products.dart';
//models
import 'package:ai_project/models/Product.dart';
//constants
import 'package:ai_project/constants.dart';
//input
import 'package:ai_project/inputComponents/widgets/InputContainer.dart';
//widgets
import 'package:ai_project/ProductDetailsComponents/widgets/ProductDeatilsWidget.dart';
import 'package:ai_project/ProductDetailsComponents/widgets/ProductImageWidget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product prod;
  ProductDetailsScreen({required this.prod});
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late TextEditingController bidPrice;
  bool _isValid = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    bidPrice = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    bidPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 180.sp,
          ),
        ),
        title: Text(
          widget.prod.name,
          style: TextStyle(fontSize: 150.sp),
          textAlign: TextAlign.center,
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              ProductImageWidget(
                imageUrl: widget.prod.imageURL,
              ),
              ProductDetailsWidget(prod: widget.prod),
              Container(
                margin: EdgeInsets.only(top: 150.sp),
                child: Form(
                  key: _formKey,
                  child: inputContainer(
                    child: TextFormField(
                      controller: bidPrice,
                      keyboardType: TextInputType.number,
                      cursorColor: kPrimaryColor,
                      validator: (value) {
                        if (value == null) {
                          value = "";
                        }
                        if (value.isEmpty) {
                          _isValid = false;
                          bidPrice.selection = TextSelection.fromPosition(
                              TextPosition(offset: value.length));
                          return 'Price can\'t be empty!';
                        } else if (double.tryParse(bidPrice.text) == null) {
                          _isValid = false;
                          return 'Price can\'t contain Characters!';
                        } else if (double.parse(bidPrice.text) <=
                            double.parse(widget.prod.bidPrice)) {
                          _isValid = false;
                          return 'price should be more than ${widget.prod.bidPrice}\$';
                        }
                        _isValid = true;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (value) {
                        if (value == null) {
                          value = "";
                        }
                        bidPrice.text = value;
                      },
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.price_check_rounded,
                            color: kPrimaryColor,
                          ),
                          hintText: 'Enter the price',
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100.sp),
                width: deviceSize.width * 0.8,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: ElevatedButton(
                    child: Text(
                      'Place Your Bid',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_isValid) {
                        try {
                          if (FirebaseAuth.instance.currentUser == null) {
                            throw Error();
                          }
                          widget.prod.setProdBidPrice(bidPrice.text);
                          widget.prod.setProdHigherBider(
                              FirebaseAuth.instance.currentUser!.email!);
                          final _ref = await Provider.of<FirebaseProvider>(
                                  context,
                                  listen: false)
                              .getDatabaseRef();
                          await _ref
                              .child(widget.prod.getProdId())
                              .update(widget.prod.toJson());
                          Navigator.of(context).pop();
                        } catch (err) {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              'Something went wrong!',
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.red,
                          ));
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
              ),
              SizedBox(
                height: deviceSize.height * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
