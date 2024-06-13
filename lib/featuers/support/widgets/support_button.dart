import 'package:flutter/material.dart';

class SupportButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onPressed;

  const SupportButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuary = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(25.0),
        backgroundColor: color,
        // Set button background color here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        shadowColor: const Color(0xFFE60024),
        // Set shadow color here
        elevation: 5, // Set elevation to create shadow effect
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 23.0,
            color: const Color(0xFFE60024), // Set icon color here
          ),
          SizedBox(width: mediaQuary.width * 0.01),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.black54, // Set text color here
            ),
          ),
        ],
      ),
    );
  }
}
