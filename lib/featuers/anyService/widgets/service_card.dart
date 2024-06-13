import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;

  const ServiceCard({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10, // Increase elevation for more visible shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            20.0), // Increase border radius to make it more circular
      ),
      child: InkWell(
        onTap: () {
          // Handle tap
        },
        child: Center(
          child: Icon(
            icon,
            size: 50,
            color: Colors.red, // Change icon color to red
          ),
        ),
      ),
    );
  }
}
