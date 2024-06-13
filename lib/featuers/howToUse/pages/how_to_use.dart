import 'package:flutter/material.dart';

import '../widgets/build_steps.dart';
import '../widgets/video_player_widget.dart';

class HowToUse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () {
            Navigator.pop(context); // رجوع إلى الشاشة السابقة
          },
        ),
        title: const Center(
          child: Text(
            'How To Use',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: ListView(children: [
        VideoPlayerWidget(), // عرض عنصر تشغيل الفيديو
        buildSteps(),
      ]),
    );
  }

  Widget buildStepContainer(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 35),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 21,
        ),
      ),
    );
  }
}