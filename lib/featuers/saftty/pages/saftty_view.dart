import 'package:Rover/featuers/saftty/widget/listTile.dart';
import 'package:Rover/featuers/saftty/widget/show_model_bottom_sheet.dart';
import 'package:Rover/featuers/settings/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SafttyView extends StatelessWidget {
  const SafttyView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuary =
        MediaQuery.of(context).size; //reposive لطول والعرض بضبط(mediaQuary)
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Safety',
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
      body: Column(
        children: [
          //Sizebox
          SizedBox(
            height: mediaQuary.height * .13,
          ),
          //image
          CircleAvatar(
              radius: mediaQuary.width * .15,
              backgroundImage: const AssetImage(
                "assets/images/verivication.png",
              )),

          //SizedBox
          SizedBox(
            height: mediaQuary.height * .038,
          ),

          //queation
          const Text(
            "Who do you want to contact?",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontStyle: FontStyle.italic),
          ),
          //SizedBox
          SizedBox(
            height: mediaQuary.height * .030,
          ),
          //Ambulance
          ListTileSaftty(
              leading: Icon(Icons.phone),
              title: ("Ambulance"),
              onTap: () {
                ShowModelBottomSheet(
                  context,
                  "175",
                );
              }),
          //police
          ListTileSaftty(
              leading: const Icon(Icons.phone),
              title: ("Police"),
              onTap: () {
                ShowModelBottomSheet(
                  context,
                  "112",
                );
              }),
          //massage
          ListTileSaftty(
              leading: const Icon(Icons.security),
              title: ("Massage"),
              onTap: () {
                ShowModelBottomSheet(
                  context,
                  "Talk to someone you trust.\n This could be a friend,\n family member, therapist,or anyone else you feel \ncomfortable confiding ",
                );
              }),
          //safety
          ListTileSaftty(
              leading: const Icon(Icons.safety_check),
              title: ("Safety tips"),
              onTap: () {
                ShowModelBottomSheet(
                  context,
                  "ohhhhhhhhhhhhh",
                );
              })
        ],
      ),
    );
  }
}
