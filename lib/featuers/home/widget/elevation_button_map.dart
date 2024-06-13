import 'package:flutter/material.dart';

class ElevationButtonMap extends StatelessWidget {
  String text;
  VoidCallback? onPreseed;
  TextStyle? style;
  Color? color;
  double? fontSize;

  ElevationButtonMap({
    required this.text,
    required this.onPreseed,
    this.style,
    this.color,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(color: color, fontSize: fontSize),
          ),
        ],
      ),
      onPressed: onPreseed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(12),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        backgroundColor: Colors.red,
      ),
    );
  }
}
