import 'package:flutter/material.dart';

Future<dynamic> ShowModelBottomSheet(BuildContext context, String? text) {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    context: context,
    builder: (BuildContext context) {
      return Text(
        text!,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      );
    },
  );
}
