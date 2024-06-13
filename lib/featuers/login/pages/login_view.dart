import 'package:Rover/cache_helper.dart';
import 'package:Rover/featuers/config/constants/colors/my_colors.dart';
import 'package:Rover/featuers/login/widgets/text_formfild_custom.dart';
import 'package:Rover/featuers/register/pages/register_view.dart';
import 'package:Rover/featuers/settings/setting_provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//import 'package:rover_app/featuers/login/widgets/text_formfild_custom.dart';

class LoginView extends StatefulWidget {
  static const String routeName = "login";

  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //main السطر دا عشان انادي علي الصفحه دي في ال
  var formKey = GlobalKey<FormState>();
  var EamilController = TextEditingController();

  var PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingProvider>(context); //اللون
    var mediaQuary =
        MediaQuery.of(context).size; //reposive لطول والعرض بضبط(mediaQuary)
    var theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.8),
            child: Form(
              //(3   :validat)
              key: formKey, //(4   :validat)
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, /////
                children: [
                  //image
                  Image.asset(
                    "assets/images/newRover.png",
                    height: mediaQuary.height * .19,
                  ),
                  //  Image.asset("assets/images/logo red2.png",width:140,height:140,) ,
                  //Image.asset("assets/images/logo red.png",width:180,height:180,) ,

                  ///Sizebox
                  SizedBox(
                    height: mediaQuary.height * .050,
                  ),

                  TextFormFieldCustom(
                    labelText: "Email",
                    hintText: "Enter Your Email",
                    prefixIcon: const Icon(Icons.email),
                    controller: EamilController,
                    keyboardType: TextInputType.emailAddress,

                    //////////validator//////////
                    ////////////(6   :validat)/////////
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'you must enter your email';
                      }
                      // var regex = RegExp(
                      //     r"^[a-zA-z0-9.a-zA-x0-9.!#$%&*+-/=?^-`{|}~]+@[a-zA-z0-9]+\-[a-zA-z]*");
                      // if (!regex.hasMatch(value)) {
                      //   return "Invaild email";
                      // }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    /////////////////////////
                  ),

                  ///Sizebox
                  SizedBox(
                    height: mediaQuary.height * .050,
                  ),
                  //password
                  TextFormFieldCustom(
                    labelText: "Password",
                    hintText: "Enter Your password",
                    prefixIcon: const Icon(Icons.remove_red_eye),
                    controller: PasswordController,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,

                    //////////validator//////////
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'you must enter your password';
                      }
                      // var regex = RegExp(
                      //     r"^(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-z])(?=.*[a-z]).*$");
                      // if (!regex.hasMatch(value)) {
                      //   return "the password must include at least \n* one Lower case letter,\n* one Uper case ,\n* one diget,\n* one specail character \n* at Least 8 characters long.";
                      // }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      print(value);
                    }, /////////////////////
                  ),

                  ///Sizebox
                  SizedBox(
                    height: mediaQuary.height * .080,
                  ),

                  // ElevatedButton
                  ElevatedButton(
                      //validate
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          try {
                            final credential = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: EamilController.text,
                                    password: PasswordController.text);
                            if (credential.user!.emailVerified) {
                              CacheHelper.saveData(
                                  key: "userId", value: credential.user!.uid);
                              Navigator.of(context)
                                  .pushReplacementNamed('home');
                            } else {
                              FirebaseAuth.instance.currentUser!
                                  .sendEmailVerification();
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc:
                                    'Please go to your email to verifay your email and activation your account ',
                              ).show();
                            }
                          } on FirebaseAuthException catch (e) {
                            debugPrint('EEeeeeeeeeeeeeeeeeeee=====${e.code}');
                            if (e.code == 'user-not-found') {
                              debugPrint('No user found for that email.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'No user found for that email.',
                                // btnCancelOnPress: () {},
                                // btnOkOnPress: () {},
                              ).show();
                            } else if (e.code == 'invalid-credential') {
                              debugPrint(
                                  'Wrong password provided for that user.');
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc:
                                    'Wrong Email Or Password provided for that user.',
                                // btnCancelOnPress: () {},
                                // btnOkOnPress: () {},
                              ).show();
                            }
                          }
                        } else {
                          debugPrint('Not Valid');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12),

                        backgroundColor: theme.primaryColor,
                        //shap
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //text
                          Text(
                            "Login ",
                            style: theme.textTheme.bodySmall?.copyWith(
                              //  shadows: List.filled(length, fill),

                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      )),
                  //SizedBox
                  SizedBox(
                    height: mediaQuary.height * .03,
                  ),

                  //Forget password
                  TextButton(
                    onPressed: () async {
                      if (EamilController.text == "") {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'Error',
                          desc:
                              'Please enter your email address and then click on "Forget Password".',
                        ).show();
                        return;
                      }
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: EamilController.text);
                        AwesomeDialog(
                                context: context,
                                dialogType: DialogType.success,
                                animType: AnimType.rightSlide,
                                title: 'Success',
                                desc:
                                    'A link to reset your password has been sent to your email. Please go to your email to reset your password.')
                            .show();
                      } catch (e) {
                        AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc:
                                    'Please ensure that the email address you entered is correct, then try again.')
                            .show();
                      }

                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (BuildContext context) {
                      //   return ForgetPasswordView();
                      // }));
                    },
                    child: Text(
                      "Forget password?",
                      textAlign: TextAlign.end,
                      style: theme.textTheme.titleMedium
                          ?.copyWith(color: MyColors.red),
                    ),
                  ),

                  //SizedBox
                  SizedBox(
                    height: mediaQuary.height * .19,
                  ),

                  ///Don't have an Account?

                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RegisterView.routeName);
                    }, //(4)
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an Account? ",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        Text("SIGNUP",
                            //  ممكن نستخدم Taxt.rich ومنها نستخدم TextSpan
                            //  وجواها children عبارة عن TextSpan بردو
                            style: theme.textTheme.bodyLarge?.copyWith(
                              color: MyColors.red,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
