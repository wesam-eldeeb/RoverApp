import 'package:Rover/featuers/anyService/widgets/service_card.dart';
import 'package:flutter/material.dart';

class AnyService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Any Service',
          style: TextStyle(
            color: Color(0xff030F09),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0), // Reduce internal padding
              child: ServiceCard(icon: _icons[index]),
            );
          },
        ),
      ),
    );
  }

  final List<IconData> _icons = [
    Icons.directions_car,
    Icons.directions_bike,
    Icons.motorcycle,
    Icons.electric_scooter,
    Icons.directions_bus,
    Icons.directions_boat,
  ];
}
