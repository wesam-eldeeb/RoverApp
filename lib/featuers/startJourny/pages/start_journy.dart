// import 'package:flutter/material.dart';
// import 'package:google_map_s/featuers/profile/pages/profile_view.dart';
// import 'package:google_map_s/featuers/startJourny/widgets/build_label_and_textField.dart';
// import 'package:google_map_s/featuers/startJourny/widgets/gender_journy_type.dart';
//
// class StartJourny extends StatelessWidget {
// //   const StartJourny({super.key});
//
// //   @override
// //   _StartJournyState createState() => _StartJournyState();
// // }
//
// // class _StartJournyState extends State<StartJourny> {
//   int? _genderValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.red),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Start Journey',
//               style: TextStyle(color: Colors.black),
//             ),
//           ],
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (BuildContext context) {
//                 return ProfileView();
//               }));
//             },
//             child: const CircleAvatar(
//               backgroundImage: AssetImage('assets/images/profile.png'),
//             ),
//           ),
//           const SizedBox(width: 10.0),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField(
//                   'From', Icons.location_on, 'New York, USA'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField(
//                   'To', Icons.location_on, 'Los Angeles, USA'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField('Salary', Icons.attach_money, '\$2000'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField('Time', Icons.access_time, '4:00 PM'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField(
//                   'Date', Icons.calendar_today, '2024-05-03'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField(
//                   'Plate Number', Icons.directions_car, 'ABC123'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField('Seats available', Icons.event_seat, '2'),
//               const SizedBox(height: 20.0),
//               buildGenderSelection(),
//               const SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle save button press
//                   print('Selected gender value: $_genderValue');
//                 },
//                 child: Text('Save', style: TextStyle(color: Colors.white)),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red,
//                 ),
//               ),
//               const SizedBox(height: 20.0),
//             ],
//           ),
//         ),
//       ),
//     );
//     // }
//
//     // Widget buildGenderSelection() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: [
//     //       const Text(
//     //         'Gender',
//     //         style: TextStyle(
//     //             color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
//     //       ),
//     //       const SizedBox(height: 10.0),
//     //       Row(
//     //         children: [
//     //           Radio(
//     //             value: 1,
//     //             groupValue: _genderValue,
//     //             onChanged: (int? value) {
//     //               setState(() {
//     //                 _genderValue = value;
//     //               });
//     //             },
//     //           ),
//     //           Text('Female'),
//     //           Radio(
//     //             value: 0,
//     //             groupValue: _genderValue,
//     //             onChanged: (int? value) {
//     //               setState(() {
//     //                 _genderValue = value;
//     //               });
//     //             },
//     //           ),
//     //           Text('Male'),
//     //           Radio(
//     //             value: 2,
//     //             groupValue: _genderValue,
//     //             onChanged: (int? value) {
//     //               setState(() {
//     //                 _genderValue = value;
//     //               });
//     //             },
//     //           ),
//     //           Text('Other'),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:google_map_s/featuers/profile/pages/profile_view.dart';
// import 'package:google_map_s/featuers/startJourny/widgets/build_label_and_textField.dart';
// import 'package:google_map_s/featuers/startJourny/widgets/gender_journy_type.dart';
//
// class StartJourny extends StatelessWidget {
// //   const StartJourny({super.key});
//
// //   @override
// //   _StartJournyState createState() => _StartJournyState();
// // }
//
// // class _StartJournyState extends State<StartJourny> {
//   int? _genderValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon:const Icon(Icons.arrow_back, color: Colors.red),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Start Journey',
//               style: TextStyle(color: Colors.black),
//             ),
//           ],
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (BuildContext context) {
//                     return ProfileView();
//                   }));
//             },
//             child: const CircleAvatar(
//               backgroundImage: AssetImage('assets/images/profile.png'),
//             ),
//           ),
//           const SizedBox(width: 10.0),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField(
//                   'From', Icons.location_on, 'New York, USA'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField(
//                   'To', Icons.location_on, 'Los Angeles, USA'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField('Price', Icons.attach_money, '\$2000'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField('Time', Icons.access_time, '4:00 PM'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField('start time', Icons.access_time, '4:00 PM'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField('expected time', Icons.access_time, '6:00 PM'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField(
//                   'Date', Icons.calendar_today, '2024-05-03'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField(
//                   'birthday (driver)', Icons.calendar_today, '1995-05-03'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField(
//                   'Plate Number', Icons.directions_car, 'ABC123'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField('Seats available', Icons.event_seat, '2'),
//               const SizedBox(height: 20.0),
//               buildGenderSelection(),
//               const SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle save button press
//                   print('Selected gender value: $_genderValue');
//                 },
//                 child: Text('Save', style: TextStyle(color: Colors.white)),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red,
//                 ),
//               ),
//               const SizedBox(height: 20.0),
//             ],
//           ),
//         ),
//       ),
//     );
// }

// Widget buildGenderSelection() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const Text(
//         'Gender',
//         style: TextStyle(
//             color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
//       ),
    //       const SizedBox(height: 10.0),
    //       Row(
    //         children: [
    //           Radio(
    //             value: 1,
    //             groupValue: _genderValue,
    //             onChanged: (int? value) {
    //               setState(() {
    //                 _genderValue = value;
    //               });
    //             },
    //           ),
    //           Text('Female'),
    //           Radio(
    //             value: 0,
    //             groupValue: _genderValue,
    //             onChanged: (int? value) {
    //               setState(() {
    //                 _genderValue = value;
    //               });
    //             },
    //           ),
    //           Text('Male'),
    //           Radio(
    //             value: 2,
    //             groupValue: _genderValue,
    //             onChanged: (int? value) {
    //               setState(() {
//                 _genderValue = value;
//               });
//             },
//           ),
//           Text('Other'),
//         ],
//       ),
//     ],
//   );
// }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../model/journey.dart';
// import '../../../model/journey_provider.dart';
// import '../../profile/pages/profile_view.dart';
// import '../widgets/build_label_and_textField.dart';
//
// class StartJourney extends StatelessWidget {
//   final TextEditingController _fromController = TextEditingController();
//   final TextEditingController _toController = TextEditingController();
//   final TextEditingController _priceController = TextEditingController();
//   final TextEditingController _timeController = TextEditingController();
//   final TextEditingController _startTimeController = TextEditingController();
//   final TextEditingController _expectedTimeController = TextEditingController();
//   final TextEditingController _dateController = TextEditingController();
//   final TextEditingController _driverBirthdayController = TextEditingController();
//   final TextEditingController _plateNumberController = TextEditingController();
//   final TextEditingController _seatsAvailableController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.red),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Start Journey',
//               style: TextStyle(color: Colors.black),
//             ),
//           ],
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileView()));
//             },
//             child: CircleAvatar(
//               backgroundImage: AssetImage('assets/images/profile.png'),
//             ),
//           ),
//           SizedBox(width: 10.0),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: 20.0),
//               buildLabelAndTextField('From', Icons.location_on, 'New York, USA', _fromController),
//               SizedBox(height: 20.0),
//               buildLabelAndTextField('To', Icons.location_on, 'Los Angeles, USA', _toController),
//               SizedBox(height: 20.0),
//               buildLabelAndTextField('Price', Icons.attach_money, '\$2000', _priceController),
//               SizedBox(height: 20.0),
//               buildLabelAndTextField('Time', Icons.access_time, '4:00 PM', _timeController),
//               SizedBox(height: 20.0),
//               buildLabelAndTextField('Start Time', Icons.access_time, '4:00 PM', _startTimeController),
//               SizedBox(height: 20.0),
//               buildLabelAndTextField('Expected Time', Icons.access_time, '6:00 PM', _expectedTimeController),
//               SizedBox(height: 20.0),
//               buildLabelAndTextField('Date', Icons.calendar_today, '2024-05-03', _dateController),
//               SizedBox(height: 20.0),
//               buildLabelAndTextField('Birthday (Driver)', Icons.calendar_today, '1995-05-03', _driverBirthdayController),
//               SizedBox(height: 20.0),
//               buildLabelAndTextField('Plate Number', Icons.directions_car, 'ABC123', _plateNumberController),
//               SizedBox(height: 20.0),
//               buildLabelAndTextField('Seats Available', Icons.event_seat, '2', _seatsAvailableController),
//               SizedBox(height: 20.0),
//               GenderSelection(),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   final journey = Journey(
//                     from: _fromController.text,
//                     to: _toController.text,
//                     price: double.parse(_priceController.text),
//                     time: _timeController.text,
//                     startTime: _startTimeController.text,
//                     expectedTime: _expectedTimeController.text,
//                     date: _dateController.text,
//                     driverBirthday: _driverBirthdayController.text,
//                     plateNumber: _plateNumberController.text,
//                     seatsAvailable: int.parse(_seatsAvailableController.text),
//                     gender: Provider.of<JourneyProvider>(context, listen: false).journey!.gender,
//                   );
//
//                   Provider.of<JourneyProvider>(context, listen: false).createJourney(journey);
//                   Provider.of<JourneyProvider>(context, listen: false).saveJourney();
//
//                   print('Journey saved: ${journey.toJson()}');
//                 },
//                 child: Text('Save', style: TextStyle(color: Colors.white)),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red,
//                 ),
//               ),
//               SizedBox(height: 20.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:google_map_s/featuers/profile/pages/profile_view.dart';
// import 'package:google_map_s/featuers/startJourny/widgets/build_label_and_textField.dart';
// import 'package:google_map_s/featuers/startJourny/widgets/gender_journy_type.dart';
//
// class StartJourny extends StatelessWidget {
//   const StartJourny({super.key});

//   @override
//   _StartJournyState createState() => _StartJournyState();
// }

import 'package:Rover/featuers/profile/pages/profile_view.dart';
import 'package:Rover/featuers/startJourny/widgets/build_label_and_textField.dart';
import 'package:Rover/featuers/startJourny/widgets/gender_journy_type.dart';
// class _StartJournyState extends State<StartJourny> {
//   int? _genderValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.red),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Start Journey',
//               style: TextStyle(color: Colors.black),
//             ),
//           ],
//         ),
//         actions: [
//           GestureDetector(
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (BuildContext context) {
//                     return ProfileView();
//                   }));
//             },
//             child: const CircleAvatar(
//               backgroundImage: AssetImage('assets/images/profile.png'),
//             ),
//           ),
//           const SizedBox(width: 10.0),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField(
//                   'From', Icons.location_on, 'New York, USA'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField(
//                   'To', Icons.location_on, 'Los Angeles, USA'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField('Salary', Icons.attach_money, '\$2000'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField('Time', Icons.access_time, '4:00 PM'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField(
//                   'Date', Icons.calendar_today, '2024-05-03'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField(
//                   'Plate Number', Icons.directions_car, 'ABC123'),
//               const SizedBox(height: 20.0),
//               buildLabelAndTextField('Seats available', Icons.event_seat, '2'),
//               const SizedBox(height: 20.0),
//               buildGenderSelection(),
//               const SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle save button press
//                   print('Selected gender value: $_genderValue');
//                 },
//                 child: Text('Save', style: TextStyle(color: Colors.white)),
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.red,
//                 ),
//               ),
//               const SizedBox(height: 20.0),
//             ],
//           ),
//         ),
//       ),
//     );
//     // }
//
//     // Widget buildGenderSelection() {
//     //   return Column(
//     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     children: [
//     //       const Text(
//     //         'Gender',
//     //         style: TextStyle(
//     //             color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
//     //       ),
//     //       const SizedBox(height: 10.0),
//     //       Row(
//     //         children: [
//     //           Radio(
//     //             value: 1,
//     //             groupValue: _genderValue,
//     //
//     //         onChanged: (int? value) {
//     //               setState(() {
//     //                 _genderValue = value;
//     //               });
//     //             },
//     //           ),
//     //           Text('Female'),
//     //           Radio(
//     //             value: 0,
//     //             groupValue: _genderValue,
//     //             onChanged: (int? value) {
//     //               setState(() {
//     //                 _genderValue = value;
//     //               });
//     //             },
//     //           ),
//     //           Text('Male'),
//     //           Radio(
//     //             value: 2,
//     //             groupValue: _genderValue,
//     //             onChanged: (int? value) {
//     //               setState(() {
//     //                 _genderValue = value;
//     //               });
//     //             },
//     //           ),
//     //           Text('Other'),
//     //         ],
//     //       ),
//     //     ],
//     //   );
//     // }
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Apis/Trip/model/journey.dart';
import '../../Apis/Trip/model/journey_provider.dart';

class StartJourney extends StatelessWidget {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _expectedTimeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _driverBirthdayController =
      TextEditingController();
  final TextEditingController _plateNumberController = TextEditingController();
  final TextEditingController _seatsAvailableController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Start Journey',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileView()));
            },
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          SizedBox(width: 10.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              buildLabelAndTextField(
                  'From', Icons.location_on, 'New York, USA', _fromController),
              SizedBox(height: 20.0),
              buildLabelAndTextField(
                  'To', Icons.location_on, 'Los Angeles, USA', _toController),
              SizedBox(height: 20.0),
              buildLabelAndTextField(
                  'Price', Icons.attach_money, '\$2000', _priceController),
              SizedBox(height: 20.0),
              buildLabelAndTextField(
                  'Time', Icons.access_time, '4:00 PM', _timeController),
              SizedBox(height: 20.0),
              buildLabelAndTextField('Start Time', Icons.access_time, '4:00 PM',
                  _startTimeController),
              SizedBox(height: 20.0),
              buildLabelAndTextField('Expected Time', Icons.access_time,
                  '6:00 PM', _expectedTimeController),
              SizedBox(height: 20.0),
              buildLabelAndTextField(
                  'Date', Icons.calendar_today, '2024-05-03', _dateController),
              SizedBox(height: 20.0),
              buildLabelAndTextField('Birthday (Driver)', Icons.calendar_today,
                  '1995-05-03', _driverBirthdayController),
              SizedBox(height: 20.0),
              buildLabelAndTextField('Plate Number', Icons.directions_car,
                  'ABC123', _plateNumberController),
              SizedBox(height: 20.0),
              buildLabelAndTextField('Seats Available', Icons.event_seat, '2',
                  _seatsAvailableController),
              SizedBox(height: 20.0),
              GenderSelection(),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // التحقق من القيم المدخلة
                  if (_fromController.text.isEmpty ||
                      _toController.text.isEmpty ||
                      _priceController.text.isEmpty ||
                      _timeController.text.isEmpty ||
                      _startTimeController.text.isEmpty ||
                      _expectedTimeController.text.isEmpty ||
                      _dateController.text.isEmpty ||
                      _driverBirthdayController.text.isEmpty ||
                      _plateNumberController.text.isEmpty ||
                      _seatsAvailableController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please fill in all fields')),
                    );
                    return;
                  }

                  try {
                    final double price = double.parse(_priceController.text);
                    final int seatsAvailable =
                        int.parse(_seatsAvailableController.text);

                    final journey = Journey(
                      from: _fromController.text,
                      to: _toController.text,
                      price: price,
                      time: _timeController.text,
                      startTime: _startTimeController.text,
                      expectedTime: _expectedTimeController.text,
                      date: _dateController.text,
                      driverBirthday: _driverBirthdayController.text,
                      plateNumber: _plateNumberController.text,
                      seatsAvailable: seatsAvailable,
                      gender:
                          Provider.of<JourneyProvider>(context, listen: false)
                              .journey!
                              .gender,
                    );

                    Provider.of<JourneyProvider>(context, listen: false)
                        .createJourney(journey);
                    Provider.of<JourneyProvider>(context, listen: false)
                        .saveJourney();

                    print('Journey saved: ${journey.toJson()}');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Invalid input: ${e.toString()}')),
                    );
                  }
                },
                child: Text('Save', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}