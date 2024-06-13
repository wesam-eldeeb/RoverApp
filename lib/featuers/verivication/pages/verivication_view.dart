// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_map_s/featuers/settings/setting_provider.dart';
// import 'package:google_map_s/featuers/verivication/widgets/text_form_field.dart';
// import 'package:provider/provider.dart';
//
// import '../../home/pages/home_map_view.dart';

// class VerivicationView extends StatelessWidget {
//   static const String routeName = "verification";
//
//   VerivicationView({super.key});
//
//   var formKey = GlobalKey<FormState>(); //(2   :validat)
//   @override
//   Widget build(BuildContext context) {
//     var mediaQuary =
//         MediaQuery.of(context).size; //reposive لطول والعرض بضبط(mediaQuary)
//     var theme = Theme.of(context);
//     var vm = Provider.of<SettingProvider>(context);
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
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
//                   "assets/images/verivication.png",
//                 )),
//
//             //SizedBox
//             SizedBox(
//               height: mediaQuary.height * .070,
//             ),
//
//             //Forget Password
//             const Text(
//               "Verification Code ?",
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
//               "Plase type the verification code sent to\n\t\t\t\t\t\t your email user@gmail.com  ",
//               style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
//             ),
//             //SizedBox
//             SizedBox(
//               height: mediaQuary.height * .040,
//             ),
//             //
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               //   child: IntrinsicHeight(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(child: TextFormVerivecation()),
//                       Spacer(
//                         flex: 1,
//                       ),
//                       Expanded(
//                         child: TextFormVerivecation(),
//                       ),
//                       Spacer(),
//                       Expanded(
//                         child: TextFormVerivecation(),
//                       ),
//                       Spacer(),
//                       Expanded(
//                         child: TextFormVerivecation(),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               //    ),
//             ),
//
//             //Sizebox
//             SizedBox(
//               height: mediaQuary.height * .040,
//             ),
//
//             ///ElevatedButton
//             // ElevatedButton(
//             //     onPressed: () {
//             //       if (formKey.currentState!.validate()) {
//             //         print("validate done");
//             //       }
//             //     },
//             //     style: ElevatedButton.styleFrom(
//             //       padding: const EdgeInsets.all(12),
//             //
//             //       backgroundColor: theme.primaryColor,
//             //       //shape
//             //       shape: RoundedRectangleBorder(
//             //           borderRadius: BorderRadius.circular(10.0)),
//             //     ),
//             //     child: Row(
//             //       mainAxisAlignment: MainAxisAlignment.center,
//             //       children: [
//             //         //text
//             //         Text(
//             //           "Ok",
//             //           style: theme.textTheme.bodySmall?.copyWith(
//             //             color: Colors.white,
//             //             fontSize: 15,
//             //           ),
//             //         ),
//             //       ],
//             //     )),
//             FirebaseAuth.instance.currentUser!.emailVerified
//               ? Text('Welcome')
//                 : MaterialButton(
//               textColor:Colors.white ,
//                 color: theme.primaryColor,
//                 shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10.0)),
//                 padding: const EdgeInsets.all(12),
//                 onPressed: (){
//                 FirebaseAuth.instance.currentUser!.sendEmailVerification();
//                 Navigator.pushReplacementNamed(
//                     context, HomeMapView.routeName);
//                 },
//                 child: Text('Ok',
//                   style: theme.textTheme.bodySmall?.copyWith(
//                 color: Colors.white,
//                 fontSize: 15,
//               ),))
//           ]),
//         ),
//       ),
//     );
//   }
// }
