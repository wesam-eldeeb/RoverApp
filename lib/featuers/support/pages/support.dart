import 'package:Rover/featuers/About/pages/about_screen.dart';
import 'package:Rover/featuers/support/widgets/support_button.dart';
import 'package:flutter/material.dart';

import '../../howToUse/pages/how_to_use.dart';

class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuary = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Support',
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
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: mediaQuary.height * .1),
            Row(
              children: [
                Expanded(
                  //Common Questions
                  child: SupportButton(
                    icon: Icons.help,
                    text: 'Common\nQuestions',
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: mediaQuary.width * 0.04),
                Expanded(
                  //How TO Use
                  child: SupportButton(
                    icon: Icons.info,
                    text: 'How to \n Use',
                    color: Colors.white, // Set button background color here
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return HowToUse();
                      }));
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: mediaQuary.height * 0.07),
            Row(
              children: [
                Expanded(
                  //  Maintenance Service
                  child: SupportButton(
                    icon: Icons.settings,
                    text: 'Maintenance\nService',
                    color: Colors.white, // Set button background color here
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: mediaQuary.width * .04),
                Expanded(
                  //About
                  child: SupportButton(
                    icon: Icons.info,
                    text: 'About\nRover',
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AboutScreen();
                      }));
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: mediaQuary.height * 0.07),
            SizedBox(
              width: double.infinity,
              child: SupportButton(
                icon: Icons.build,
                text: 'Specialized \n Service',
                color: const Color.fromARGB(255, 254, 255, 255),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
