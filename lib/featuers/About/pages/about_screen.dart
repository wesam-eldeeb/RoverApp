import 'package:Rover/featuers/config/constants/colors/my_colors.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = 'about_screen';

  @override
  Widget build(BuildContext context) {
    var mediaQuary = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(color: MyColors.black),
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
      backgroundColor: Colors.white,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 220,
            // width: 150,
            // color: Colors.cyan,
            child: Image.asset(
              'assets/images/about.png',
              height: mediaQuary.height * .3,
              width: mediaQuary.width * .3,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 35),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your Choice, Your Ride",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color(0xffE60024),
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 35),
            child: const Column(
              children: [
                Text(
                  "Welcome to Rover app! We are here to make your daily commutes easier and more comfortable. \n"
                  "Whether you need a quick ride or are planning a long journey, we offer you a reliable and friendly service to meet all your needs.\n"
                  "Enjoy a seamless and secure user experience,"
                  "and join a community of users who share your passion for comfortable and enjoyable transportation.\n"
                  "Let us be your companion on all your trips, and we'll ensure a happy journey every time.\n"
                  "Thank you for choosing us, and we wish you always enjoyable and safe trips!\n",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 19, color: Color(0xff707070)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
