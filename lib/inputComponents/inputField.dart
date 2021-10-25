import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//constants
import '../constants.dart';
//inputHelpers
import './InputContainer.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final bool obsecure;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final controller = TextEditingController();
  InputField(
      {required this.hintText,
      required this.icon,
      required this.onChanged,
      required this.obsecure});

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return inputContainer(
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obsecure,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            icon: Icon(
              widget.icon,
              color: kPrimaryColor,
            ),
            suffixIcon: widget.obsecure
                ? Icon(
                    Icons.visibility,
                    color: kPrimaryColor,
                  )
                : null,
            hintText: widget.hintText,
            border: InputBorder.none),
      ),
    );
  }
}
