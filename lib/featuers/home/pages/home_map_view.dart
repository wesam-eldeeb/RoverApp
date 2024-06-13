import 'package:Rover/featuers/config/constants/colors/my_colors.dart';
import 'package:Rover/featuers/home/widget/custom_navigater_drawer.dart';
import 'package:Rover/featuers/home/widget/elevation_button_driver.dart';
import 'package:Rover/featuers/home/widget/elevation_button_passenger.dart';
import 'package:flutter/material.dart';

class HomeMapView extends StatelessWidget {
  static const String routeName = "home";

  const HomeMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  this is default app bar
      appBar: AppBar(
        backgroundColor: MyColors.red,
        title: const Text(
          'Rover',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        // actions: [
        //   IconButton(
        //       onPressed: () async {
        //         await FirebaseAuth.instance.signOut();
        //         CacheHelper.removeData(key: "userId");
        //         Navigator.of(context)
        //             .pushNamedAndRemoveUntil('login', (route) => false);
        //       },
        //       icon: Icon(Icons.logout))
        // ],
      ),
      //Drawer
      drawer: CustomNavigationDrawer()

      //Desien on page
      ,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/map.png",
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  //ElevatedButton(Driver)
                  ElvationButtonDriver(),
                  const Spacer(),
                  //ElevatedButton(Passenger)
                  ElvationButtonPassenger(),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
