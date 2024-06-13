// import 'package:flutter/material.dart';
//
// Widget buildLabelAndTextField(String label, IconData icon, String hintText, TextEditingController priceController) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.stretch,
//     children: [
//       Text(
//         label,
//         style: const TextStyle(
//             color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
//       ),
//       const SizedBox(height: 10.0),
//       Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 3,
//               blurRadius: 7,
//               offset: Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: TextField(
//             decoration: InputDecoration(
//               hintText: hintText,
//               icon: Icon(icon, color: Colors.red),
//               border: const UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.red),
//               ),
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

import 'package:flutter/material.dart';

Widget buildLabelAndTextField(String label, IconData icon, String hintText,
    TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        label,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0),
      ),
      SizedBox(height: 10.0),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              icon: Icon(icon, color: Colors.red),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
