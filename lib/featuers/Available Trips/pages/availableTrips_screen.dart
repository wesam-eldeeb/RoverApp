// import 'package:Rover/featuers/Available%20Trips/model/availableTtips_model.dart';
// import 'package:Rover/featuers/Available%20Trips/services/get_available_trips.dart';
import 'package:Rover/featuers/Available%20Trips/models/available_model.dart';
import 'package:Rover/featuers/Available%20Trips/services/get_available_service.dart';
import 'package:Rover/featuers/Available%20Trips/widgets/trip_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AvailableScreen extends StatelessWidget {
  static const String routeName = 'availableTrips_screen';

  @override
  Widget build(BuildContext context) {
    var mediaQuary = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Available Trips',
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
      body: FutureBuilder<List<AvailableModel>>(
        future: AvailableService().getAvailable(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<AvailableModel> trips = snapshot.data!;
            return ListView.builder(
              itemCount: trips.length,
              clipBehavior: Clip.none,
              itemBuilder: (context, index) {
                return TripItem(
                  print(FirebaseAuth.instance.currentUser?.uid),
                  availableTips: trips[index],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
    // Column(
    //   children: [
    //     Column(children: [
    //       // Flexible(
    //       //   flex: 1,
    //       //   child: Padding(
    //       //     padding: const EdgeInsets.all(12),
    //       //     child: TextField(
    //       //       cursorColor: Colors.red,
    //       //       decoration: InputDecoration(
    //       //           // fillColor: Color(0xffFFFFFF),
    //       //           fillColor: Colors.red,
    //       //           filled: true,
    //       //           border: OutlineInputBorder(
    //       //             borderRadius: BorderRadius.circular(15),
    //       //             borderSide: BorderSide.none,
    //       //             // borderSide: BorderSide(color: Colors.red),
    //       //           ),
    //       //           hintText: 'Search',
    //       //           hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
    //       //           prefixIcon: Container(
    //       //               padding: EdgeInsets.all(12),
    //       //               child: Icon(
    //       //                 Icons.search,
    //       //                 color: Colors.black,
    //       //               ))),
    //       //     ),
    //       //   ),
    //       // ),
    //       Container(
    //         height: MediaQuery.sizeOf(context).height * 0.07,
    //         width: MediaQuery.sizeOf(context).width * 0.93,
    //         margin: EdgeInsets.all(10),
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(12),
    //             color: Color(0xffFFFFFF),
    //             boxShadow: [
    //               BoxShadow(
    //                 blurRadius: 8,
    //                 offset: Offset(0, 0),
    //                 color: Colors.grey.withOpacity(0.4),
    //               )
    //             ]),
    //         child: TextField(
    //           decoration: InputDecoration(
    //             border: OutlineInputBorder(
    //               borderSide: BorderSide.none,
    //             ),
    //             hintText: "Search",
    //             hintStyle: TextStyle(fontSize: 15, color: Colors.black),
    //             prefixIcon: Icon(Icons.search),
    //             prefixIconColor: Colors.black,
    //           ),
    //         ),
    //       ),

    //       FutureBuilder<List<AvailableTipsModel>>(
    //         future: AvailableTripsService().getAvailableTrips(),
    //         builder: (context, snapshot) {
    //           if (snapshot.hasData) {
    //             List<AvailableTipsModel> prouducts = snapshot.data!;
    //             return ListView.builder(
    //               itemCount: prouducts.length,
    //               clipBehavior: Clip.none,
    //               itemBuilder: (context, index) {
    //                 return TripItem(
    //                   name: "Matthew Brewer",
    //                   destination: "Alex",
    //                   travelTime: "20 Minutes",
    //                   numPassengers: "4 People",
    //                   cost: "300 LE",
    //                   isAccepted: true,
    //                   image: AssetImage("assets/images/person.png"),
    //                 );
    //               },
    //             );
    //           } else {
    //             return Center(
    //               child: CircularProgressIndicator(),
    //             );
    //           }
    //         },
    //       ),

    //       // TripItem(
    //       //   name: "Matthew Brewer",
    //       //   destination: "Alex",
    //       //   travelTime: "20 Minutes",
    //       //   numPassengers: "4 People",
    //       //   cost: "300 LE",
    //       //   isAccepted: true,
    //       //   image: AssetImage("assets/images/person.png"),
    //       // ),
    //       // TripItem(
    //       //   name: "Matthew Brewer",
    //       //   destination: "Alex",
    //       //   travelTime: "20 Minutes",
    //       //   numPassengers: "4 People",
    //       //   cost: "300 LE",
    //       //   isAccepted: false,
    //       //   image: AssetImage("assets/images/person.png"),
    //       // ),
    //       // TripItem(
    //       //   name: "Matthew Brewer",
    //       //   destination: "Alex",
    //       //   travelTime: "20 Minutes",
    //       //   numPassengers: "4 People",
    //       //   cost: "300 LE",
    //       //   isAccepted: true,
    //       //   image: AssetImage("assets/images/person.png"),
    //       // ),
    //       // TripItem(
    //       //   name: "Matthew Brewer",
    //       //   destination: "Alex",
    //       //   travelTime: "20 Minutes",
    //       //   numPassengers: "4 People",
    //       //   cost: "300 LE",
    //       //   isAccepted: true,
    //       //   image: AssetImage("assets/images/person.png"),
    //       // ),
    //     ]),
    //   ],
    // ));
  }
}
