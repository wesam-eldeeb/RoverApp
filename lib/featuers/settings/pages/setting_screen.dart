import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../cache_helper.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = 'setting_screen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingScreen> {
  bool isDarkModeOn = false;
  bool isSaveDataOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Setting',
          style: TextStyle(
            color: Color(0xff030F09),
            fontWeight: FontWeight.bold,
            fontSize: 18,
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
      body: ListView(
        children: [
          ListTile(
            title: Text(
              'Dark Mode',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff030F09)),
            ),
            trailing: Switch(
              activeColor: Colors.redAccent,
              value: isDarkModeOn,
              onChanged: (value) {
                setState(() {
                  isDarkModeOn = value;
                });
              },
            ),
          ),
          ListTile(
            title: Text(
              'Save Data & Distance',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff030F09)),
            ),
            trailing: Switch(
              activeColor: Colors.redAccent,
              value: isSaveDataOn,
              onChanged: (value) {
                setState(() {
                  isSaveDataOn = value;
                });
              },
            ),
          ),
          Divider(
            color: Color(0xffE6E6E6),
            thickness: 2,
          ),
          ListTile(
            title: Text(
              'Change Language',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff030F09)),
            ),
            trailing: DropdownButton<String>(
              value: 'English',
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xff030F09)),
              items:
              <String>['English', 'Arabic', 'French'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {},
            ),
          ),
          ListTile(
            title: Text(
              "Delete Account",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xffE60024),
              ),
            ),
            onTap: () {
              // Implement option 2 functionality
            },
          ),
          ListTile(
            title: const Text("Log Out",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffE60024),
                )),
            trailing: const Icon(
              Icons.logout,
              color: Color(0xffE60024),
            ),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              CacheHelper.removeData(key: "userId");
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('login', (route) => false);
            },
            // Implement option 1 functionality
          ),
        ],
      ),
    );
  }
}
