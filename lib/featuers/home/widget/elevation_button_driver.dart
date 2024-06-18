//ElvationButtonDevolope(********* Driver)

import 'package:Rover/featuers/completeProfile/complet_profile.dart';
import 'package:Rover/featuers/config/constants/colors/my_colors.dart';
import 'package:Rover/featuers/home/widget/elevation_button_map.dart';
import 'package:Rover/featuers/startJourny/pages/start_journy.dart';
import 'package:flutter/material.dart';

class ElvationButtonDriver extends StatelessWidget {
  ElvationButtonDriver({required this.onTap});

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          context: context,
          builder: (BuildContext context) {
            // هنا يمكنك إضافة المحتوى الذي تريد عرضه في الـ BottomSheet
            return
                // Column(
                //   children: [
                //     Spacer(),
                Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //  ElevationButtonDriver CompletProfile
                  ElevationButtonMap(
                      text: "Complete Profile",
                      onPreseed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return CompleteProfile();
                        }));
                      }),
                  //  ElevationButtonDriver createTripe
                  ElevationButtonMap(
                      text: "Start Journey",
                      onPreseed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return StartJourney();
                        }));
                      }),
                ],
              ),
            );
            // const Spacer(),
            // TextFieldMap(labelText: "Your Location"),
            // const Spacer(),
            // TextFieldMap(labelText: "Your Destination"),
            // const Spacer(),
            //   TextFieldMap(labelText: "Your Price"),
            // const Spacer(),
            // ElevationButtonMap(text: "Complete", onPreseed: () {}),
            //  ],
            //  );
          },
        );
      },
      child: Text("\t \t Driver \t \t"),
      style: ElevatedButton.styleFrom(backgroundColor: MyColors.red),
    );
  }
}
