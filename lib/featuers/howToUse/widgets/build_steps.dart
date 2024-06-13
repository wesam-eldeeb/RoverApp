import 'package:flutter/material.dart';

Widget buildSteps() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Steps',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      buildStep("1- Create an Account:\n"
          "- Enter your first and last name, email, and password.\n- Confirm your password and save your details.\n- Ensure that the email format is correct and the password is strong."),
      buildStep("2- Ensure your email by signing in:\n"
          "- Use your registered email and password to log in.\n- If you forget your password, use the (Forgot Password) feature to recover it."),
      buildStep("3- Complete your Profile:\n"
          "- After logging in, complete your profile with additional details like date of birth, gender, phone number, and national ID.\n- Upload a profile picture as per the requirements."),
      buildStep("4- Select your route:\n"
          "- Choose either (Driver) or (Regular User).\n- If you choose (Driver), provide car details, driver's license image, and car registration number."),
      buildStep("5- Initiate a Trip (for Drivers):\n"
          "- Enter trip details such as start and end locations, price, time, date, car type, available seats, and passenger gender preference.\n- Save the trip details."),
      buildStep("6- Search and Join Trips (for Regular Users):\n"
          "- Browse existing trips, search by destination, and view trip details.\n- Click (Accept This Trip) to join, and the trip will appear in your (My Trips) section."),
      buildStep("7- Use Chat Feature:\n"
          "- Communicate with drivers or passengers through the in-app chat feature."),
      buildStep("8- Manage Trips:\n"
          "- View your trip history, including past and upcoming trips.\n- Drivers can update trip details, such as the number of available seats."),
      buildStep("9- Access Additional Features:\n"
          "- Use the More button for options like editing your profile, changing application settings, accessing safety features, and seeking support."),
    ],
  );
}

Widget buildStep(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
          child: Center(
            child: Text(
              text.substring(0, 1),
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            text.substring(3),
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    ),
  );
}