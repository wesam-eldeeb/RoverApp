import 'package:Rover/featuers/Category/pages/tab_container.dart';
import 'package:Rover/featuers/My%20Trip/widgets/myTrip_delete_passenger.dart';
import 'package:Rover/featuers/My%20Trip/widgets/myTrip_item_passenger.dart';
import 'package:flutter/material.dart';

class MytripScreenPassenger extends StatelessWidget {
  static const String routeName = 'myTrip_screen_passenger';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'MyTrips',
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
          actions: [
            Image.asset(
              'assets/images/profile.png',
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  width: MediaQuery.sizeOf(context).width * 0.90,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xffFFFFFF),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          offset: Offset(0, 0),
                          color: Colors.grey.withOpacity(0.4),
                        )
                      ]),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search",
                      hintStyle: TextStyle(fontSize: 15, color: Colors.black),
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.black,
                    ),
                  ),
                ),
                Container(
                  child: TabContainer(),
                  //   child: Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // children: [
                  //   TabItem(isSelected: true, source: "All"),
                  //   TabItem(isSelected: false, source: "New"),
                  // ],
                  // )),
                ),
                MyTripItemPassenger(
                    date: "16/2/2024",
                    day: "Monday",
                    time: "3pm",
                    to: "Alex",
                    from: "Cairo",
                    price: "100 LE",
                    image: AssetImage("assets/images/person.png")),
                MyTripItemPassenger(
                    date: "16/2/2024",
                    day: "Monday",
                    time: "3pm",
                    to: "Alex",
                    from: "Cairo",
                    price: "100 LE",
                    image: AssetImage("assets/images/person.png")),
                MyTripDeletePassenger(
                    date: "16/2/2024",
                    day: "Monday",
                    time: "3pm",
                    to: "Alex",
                    from: "Cairo",
                    price: "100 LE",
                    image: AssetImage("assets/images/person.png")),
              ],
            ),
          ],
        ));
  }
}
