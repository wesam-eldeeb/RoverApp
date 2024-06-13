// import 'package:flutter/material.dart';
//
// class buildGenderSelection extends StatefulWidget {
//   const buildGenderSelection({super.key});
//
//   @override
//   State<buildGenderSelection> createState() => _buildGenderSelectionState();
// }
//
// class _buildGenderSonState extends State<buildGenderSelection> {
//   int? _genderValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Gender',
//           style: TextStyle(
//               color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
//         ),
//         const SizedBox(height: 10.0),
//         Row(
//           children: [
//             Radio(
//               value: 1,
//               groupValue: _genderValue,
//               onChanged: (int? value) {
//                 setState(() {
//                   _genderValue = value;
//                 });
//               },
//             ),
//             Text('Female'),
//             Radio(
//               value: 0,
//               groupValue: _genderValue,
//               onChanged: (int? value) {
//                 setState(() {
//                   _genderValue = value;
//                 });
//               },
//             ),
//             Text('Male'),
//             Radio(
//               value: 2,
//               groupValue: _genderValue,
//               onChanged: (int? value) {
//                 setState(() {
//                   _genderValue = value;
//                 });
//               },
//             ),
//             Text('Other'),
//           ],
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class  buildGenderSelection extends StatefulWidget {
//   const  buildGenderSelection({super.key});
//
//   @override
//   State< buildGenderSelection> createState() => _buildGenderSelectionState();
// }
//
// class _buildGenderSelectionState extends State< buildGenderSelection> {
//   int? _genderValue;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Gender passenger',
//           style: TextStyle(
//               color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
//         ),
//         const SizedBox(height: 10.0),
//         Row(
//           children: [
//             Radio(
//               value: 1,
//               groupValue: _genderValue,
//               onChanged: (int? value) {
//                 setState(() {
//                   _genderValue = value;
//                 });
//               },
//             ),
//             Text('Female'),
//             Radio(
//               value: 0,
//               groupValue: _genderValue,
//               onChanged: (int? value) {
//                 setState(() {
//                   _genderValue = value;
//                 });
//               },
//             ),
//             Text('Male'),
//             Radio(
//               value: 2,
//               groupValue: _genderValue,
//               onChanged: (int? value) {
//                 setState(() {
//                   _genderValue = value;
//                 });
//               },
//             ),
//             Text('both'),
//           ],
//         ),
//       ],
//     );
//   }
//
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import 'package:google_map_s/providers/journey_provider.dart';

import '../../Apis/Trip/model/journey_provider.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key});

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  int? _genderValue;

  @override
  void initState() {
    super.initState();
    _genderValue =
        Provider.of<JourneyProvider>(context, listen: false).journey?.gender;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender Passenger',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        SizedBox(height: 10.0),
        Row(
          children: [
            Radio(
              value: 1,
              groupValue: _genderValue,
              onChanged: (int? value) {
                setState(() {
                  _genderValue = value;
                  Provider.of<JourneyProvider>(context, listen: false)
                      .journey
                      ?.gender = value!;
                });
              },
            ),
            Text('Female'),
            Radio(
              value: 0,
              groupValue: _genderValue,
              onChanged: (int? value) {
                setState(() {
                  _genderValue = value;
                  Provider.of<JourneyProvider>(context, listen: false)
                      .journey
                      ?.gender = value!;
                });
              },
            ),
            Text('Male'),
            Radio(
              value: 2,
              groupValue: _genderValue,
              onChanged: (int? value) {
                setState(() {
                  _genderValue = value;
                  Provider.of<JourneyProvider>(context, listen: false)
                      .journey
                      ?.gender = value!;
                });
              },
            ),
            Text('Both'),
          ],
        ),
      ],
    );
  }
}
