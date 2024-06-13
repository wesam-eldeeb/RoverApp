// import 'package:flutter/material.dart';
// import 'package:google_map_s/featuers/login/widgets/text_formfild_custom.dart';
// import 'package:google_map_s/featuers/settings/setting_provider.dart';
// import 'package:provider/provider.dart';

// class ForgetPasswordView extends StatelessWidget {
//   ForgetPasswordView({super.key});
//
//   var EamilController = TextEditingController();
//   var formKey = GlobalKey<FormState>(); //(2   :validat)
//   @override
//   Widget build(BuildContext context) {
//     var mediaQuary =
//         MediaQuery.of(context).size; //reposive لطول والعرض بضبط(mediaQuary)
//     var theme = Theme.of(context);
//     var vm = Provider.of<SettingProvider>(context);
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 35),
//         child: Form(
//           //(3   :validat)
//           key: formKey, //(4   :validat)
//           child: Column(children: [
//             //Sizebox
//             SizedBox(
//               height: mediaQuary.height * .2,
//             ),
//             //image
//             CircleAvatar(
//                 radius: mediaQuary.width * .15,
//                 backgroundImage: const AssetImage(
//                   "assets/images/forget.png",
//                 )),
//
//             //SizedBox
//             SizedBox(
//               height: mediaQuary.height * .070,
//             ),
//
//             //Forget Password
//             const Text(
//               "Forget Password ?",
//               style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                   fontStyle: FontStyle.italic),
//             ),
//
//             //SizedBox
//             SizedBox(
//               height: mediaQuary.height * .015,
//             ),
//             //text
//             const Text(
//               "Enter your email address to receive \n\t\t\t \t\t \t\t verification code",
//               style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
//             ),
//             //SizedBox
//             SizedBox(
//               height: mediaQuary.height * .040,
//             ),
//             //  Email
//             TextFormFieldCustom(
//               labelText: "Email",
//               hintText: "Enter Your Email",
//               prefixIcon: const Icon(Icons.email),
//               controller: EamilController,
//               keyboardType: TextInputType.emailAddress,
//             ),
//
//             //Sizebox
//             SizedBox(
//               height: mediaQuary.height * .040,
//             ),
//
//             ///ElevatedButton
//             ElevatedButton(
//                 onPressed: () {
//                   if (formKey.currentState!.validate()) {
//                     print("validate done");
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: const EdgeInsets.all(12),
//
//                   backgroundColor: theme.primaryColor,
//                   //shape
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0)),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     //text
//                     Text(
//                       "Send",
//                       style: theme.textTheme.bodySmall?.copyWith(
//                         color: Colors.white,
//                         fontSize: 15,
//                       ),
//                     ),
//                   ],
//                 )),
//           ]),
//         ),
//       ),
//     );
//   }
// }
