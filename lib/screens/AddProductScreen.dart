import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
//constants
import '../constants.dart';
//input
import '../inputComponents/InputContainer.dart';
//models
import '../models/Products.dart';
import '../models/AppState.dart';
//screens

class AddProductScreen extends StatefulWidget {
  static String name = "AddProductScreen";
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late TextEditingController productName;
  late TextEditingController startingPrice;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    productName = TextEditingController();
    startingPrice = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    startingPrice.dispose();
    productName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isValid = false;
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Product',
          style: TextStyle(fontSize: 180.sp),
        ),
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 200.sp,
          ),
        ),
        actions: [],
      ),
      body: Stack(children: [
        Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.topCenter,
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: deviceSize.height * 0.1,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      child: Text(
                        'Product Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 220.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    inputContainer(
                      child: TextFormField(
                        controller: productName,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          if (value == null) {
                            value = "";
                          }
                          productName.text = value;
                        },
                        validator: (value) {
                          if (value == null) {
                            value = "";
                          }
                          if (value.length < 3) {
                            return 'Name should be at least 3 characters long!';
                          }
                          return null;
                        },
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.text_fields_rounded,
                              color: kPrimaryColor,
                            ),
                            hintText: 'Enter Product Name',
                            border: InputBorder.none),
                      ),
                    ),
                    inputContainer(
                      child: TextFormField(
                        controller: startingPrice,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onSaved: (value) {
                          if (value == null) {
                            value = "0";
                          }
                          startingPrice.text = value;
                        },
                        validator: (value) {
                          if (value == null) {
                            return "you must give starting Price!";
                          } else if (value == "") {
                            return "you must give starting Price!";
                          } else if (value.characters.contains(
                            new RegExp(r'[A-Z]'),
                          )) {
                            return 'Price must be numbers only';
                          } else if (double.parse(value) < 0) {
                            return 'Price must be bigger than Zero';
                          }

                          isValid = true;

                          return null;
                        },
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.price_change_rounded,
                              color: kPrimaryColor,
                            ),
                            hintText: 'Enter starting price',
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      width: deviceSize.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: ElevatedButton(
                          child: Text(
                            'Add Product',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            isValid = _formKey.currentState!.validate();
                            print(isValid);
                            if (isValid) {
                              _formKey.currentState!.save();
                              try {
                                Provider.of<Products>(context, listen: false)
                                    .addProduct(
                                        productName.text, startingPrice.text);
                                Provider.of<AppState>(context, listen: false)
                                    .setMenu();
                                Navigator.of(context).pop();
                              } catch (err) {
                                print(err);
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                    "Colud\'nt add product!",
                                    textAlign: TextAlign.center,
                                  ),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
