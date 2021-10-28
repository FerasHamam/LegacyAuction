import 'package:flutter/material.dart';
//constants
import '../constants.dart';
//input
import '../inputComponents/InputContainer.dart';

class AddProductScreen extends StatefulWidget {
  static String name = "AddProductScreen";
  final GlobalKey _formKey = GlobalKey();
  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController startingPrice = TextEditingController();
  TextEditingController leastBid = TextEditingController();
  @override
  void dispose() {
    name.dispose();
    startingPrice.dispose();
    leastBid.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Product'),
        backgroundColor: kPrimaryColor,
      ),
      body: Form(
        key: widget._formKey,
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: [
                inputContainer(
                  child: TextFormField(
                    controller: name,
                    cursorColor: kPrimaryColor,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.text_fields_rounded,
                          color: kPrimaryColor,
                        ),
                        hintText: 'Enter Name',
                        border: InputBorder.none),
                  ),
                ),
                inputContainer(
                  child: TextFormField(
                    controller: startingPrice,
                    cursorColor: kPrimaryColor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.price_check_rounded,
                          color: kPrimaryColor,
                        ),
                        hintText: 'Enter starting price',
                        border: InputBorder.none),
                  ),
                ),
                inputContainer(
                  child: TextFormField(
                    controller: leastBid,
                    cursorColor: kPrimaryColor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.price_change_rounded,
                          color: kPrimaryColor,
                        ),
                        hintText: 'Enter least bid price',
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
