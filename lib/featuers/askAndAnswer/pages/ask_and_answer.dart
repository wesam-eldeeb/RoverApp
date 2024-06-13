import 'package:Rover/featuers/askAndAnswer/widgets/ask_question.dart';
import 'package:flutter/material.dart';

class AskAndAnswerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ask & Answer',
          style: TextStyle(color: Colors.black), // Change text color to black
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.red, // Change arrow color to red
          ),
          onPressed: () {
            // Handle back button press
          },
        ),
        backgroundColor: Colors.white, // Change app bar color to white
      ),
      backgroundColor: const Color.fromARGB(255, 225, 224, 224),
      // Reduce scaffold background color brightness
      body: AskQuestion(),
    );
  }
}
