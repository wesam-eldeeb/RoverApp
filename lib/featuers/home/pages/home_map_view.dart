import 'package:Rover/featuers/config/constants/colors/my_colors.dart';
import 'package:Rover/featuers/home/model/User_model.dart';
import 'package:Rover/featuers/home/services/user_service.dart';
import 'package:Rover/featuers/home/widget/custom_navigater_drawer.dart';
import 'package:Rover/featuers/home/widget/elevation_button_driver.dart';
import 'package:Rover/featuers/home/widget/elevation_button_passenger.dart';
import 'package:flutter/material.dart';

class HomeMapView extends StatefulWidget {
  static const String routeName = "home";

  const HomeMapView({super.key});

  @override
  State<HomeMapView> createState() => _HomeMapViewState();
}

class _HomeMapViewState extends State<HomeMapView> {
  bool isLoading = false;

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
                  ElvationButtonDriver(
                    onTap: () {
                      isLoading = true;
                      setState(() {});
                      try {
                        updateUser;
                      } catch (e) {
                        print(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    },
                  ),
                  const Spacer(),
                  //ElevatedButton(Passenger)
                  ElvationButtonPassenger(
                    onTap: () {
                      isLoading = true;
                      setState(() {});
                      try {
                        updateUser;
                      } catch (e) {
                        print(e.toString());
                      }
                      isLoading = false;
                      setState(() {});
                    },
                  ),
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

  void updateUser(UserrModel user) {
    UpdateUserService().updateUser(
      userId: 'alaa1',
      user_Picture: 'string',
      first_Name: 'string',
      last_Name: 'string',
      email: 'string',
      password: 'string',
      phone: 'string',
      gender: 'string',
      type: '2',
    );
    isLoading = false;
  }
}
