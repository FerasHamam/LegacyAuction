import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
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
  late TextEditingController desc;
  late TextEditingController startingPrice;
  late TextEditingController imageUrl;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    productName = TextEditingController();
    desc = TextEditingController();
    startingPrice = TextEditingController();
    imageUrl = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    startingPrice.dispose();
    productName.dispose();
    desc.dispose();
    imageUrl.dispose();
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
          style: TextStyle(fontSize: 160.sp),
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
      ),
      body: Stack(children: [
        Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.topCenter,
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
                          isValid = false;
                          return 'Name should be at least 3 characters long!';
                        }
                        isValid = true;
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
                        controller: desc,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        cursorColor: kPrimaryColor,
                        maxLines: 6,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.description_rounded,
                              color: kPrimaryColor,
                            ),
                            hintText: 'Enter Product Description',
                            alignLabelWithHint: true,
                            border: InputBorder.none),
                        onSaved: (value) {
                          if (value == null) {
                            value = "";
                          }
                          desc.text = value;
                        },
                        validator: (value) {
                          if (value == null) {
                            value = "";
                          }
                          if (value.trim().length < 5) {
                            isValid = false;
                            return 'Description should be at least 5 characters long!';
                          }
                          isValid = true;
                          return null;
                        }),
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
                          isValid = false;
                          return "you must give starting Price!";
                        } else if (value.characters.contains(
                          new RegExp(r'[A-Z]'),
                        )) {
                          isValid = false;
                          return 'Price must be numbers only';
                        } else if (double.parse(value) < 0) {
                          isValid = false;
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
                          hintText: 'Enter Reserve Price',
                          border: InputBorder.none),
                    ),
                  ),
                  inputContainer(
                    child: TextFormField(
                      controller: imageUrl,
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      onSaved: (value) async {
                        if (value == null) {
                          value = "0";
                        }
                        imageUrl.text = value;
                      },
                      validator: (value) {
                        if (value!.contains('https://') == false)
                          value = 'https://' + value;
                        ;
                        if (value == "") {
                          isValid = false;
                          return "you must enter image URL!";
                        } else if (Uri.tryParse(value) != null) {
                          http.get(Uri.parse(value)).then((response) {
                            try {
                              if (response.statusCode == 200) {
                                isValid = true;
                                return null;
                              }
                            } catch (err) {
                              isValid = false;
                              return 'image url is no valid!';
                            }
                          });
                        }
                      },
                      cursorColor: kPrimaryColor,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.image_rounded,
                            color: kPrimaryColor,
                          ),
                          hintText: 'Enter Image URL',
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
                          if (isValid) {
                            _formKey.currentState!.save();
                            try {
                              Provider.of<Products>(context, listen: false)
                                  .addProduct(productName.text, desc.text,
                                      startingPrice.text, imageUrl.text);
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
      ]),
    );
  }
}
