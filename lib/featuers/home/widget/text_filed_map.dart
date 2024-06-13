import 'package:Rover/featuers/config/constants/colors/my_colors.dart';
import 'package:flutter/material.dart';

class TextFieldMap extends StatelessWidget {
  String labelText;

  TextFieldMap({
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
          cursorColor: MyColors.red,
          style: const TextStyle(color: MyColors.red),
          decoration: InputDecoration(
              labelText: labelText,
              hintStyle: const TextStyle(color: Colors.black),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: MyColors.red),
              ))),
    );
  }
}
