//ElvationButtonDevolope(********* Driver)

import 'package:Rover/featuers/Available%20Trips/pages/availableTrips_screen.dart';
import 'package:Rover/featuers/config/constants/colors/my_colors.dart';
import 'package:Rover/featuers/home/widget/elevation_button_map.dart';
import 'package:flutter/material.dart';

class ElvationButtonPassenger extends StatelessWidget {
  ElvationButtonPassenger({required this.onTap});

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap;
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
                    ElevationButtonMap(
                        text: " \t\t \t\t  Search \t\t \t\t ",
                        onPreseed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) {
                                return AvailableScreen();
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
            // ElevationButtonMap(text: "Search", onPreseed: () {}),
            //  ],
            //);
          },
        );
      },
      child: Text("Passenger"),
      style: ElevatedButton.styleFrom(backgroundColor: MyColors.red),
    );
  }
}
