import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  bool isSelected;
  String source;

  TabItem({required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Color(0xffE60024),
            width: 2,
          ),
          //color: isSelected ? Theme.of(context).primaryColor : Colors.transparent
          color: isSelected ? Color(0xffE60024) : Color(0xffFFFFFF)),
      child: Text(
        source ?? "",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isSelected ? Color(0xffFFFFFF) : Color(0xffE60024),
        ),
      ),
    );
  }
}
