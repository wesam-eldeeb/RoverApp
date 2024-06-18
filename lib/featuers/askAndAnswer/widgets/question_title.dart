// import 'package:Rover/featuers/askAndAnswer/widgets/question_model.dart';
// import 'package:flutter/material.dart';
//
// class QuestionTile extends StatelessWidget {
//   final QuestionModel question;
//   final VoidCallback onLovePressed;
//   final VoidCallback onReplyPressed;
//
//   const QuestionTile({
//     required this.question,
//     required this.onLovePressed,
//     required this.onReplyPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           ListTile(
//             leading: const CircleAvatar(
//               backgroundImage: AssetImage('assets/images/profile.png'),
//             ),
//             title: Text(question.question),
//             subtitle: Row(
//               children: [
//                 TextButton(
//                   onPressed: onReplyPressed,
//                   child: Text('Reply'),
//                 ),
//                 const Spacer(),
//                 IconButton(
//                   icon: Icon(
//                     question.isLoved ? Icons.favorite : Icons.favorite_border,
//                     color: question.isLoved ? Colors.red : null,
//                   ),
//                   onPressed: onLovePressed,
//                 ),
//               ],
//             ),
//           ),
//           const Divider(), // Add a divider
//           // Display answers
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: question.answers.map((answer) {
//               return Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: Row(
//                   children: [
//                     const CircleAvatar(
//                       backgroundImage: AssetImage('assets/profile_image.png'),
//                     ),
//                     const SizedBox(width: 8.0),
//                     Expanded(
//                       child: Text(
//                         answer,
//                         style: const TextStyle(fontSize: 16.0),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }
