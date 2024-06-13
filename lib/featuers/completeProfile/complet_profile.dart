// import 'dart:html';
import 'dart:io';

import 'package:Rover/featuers/config/constants/colors/my_colors.dart';
import 'package:Rover/featuers/login/pages/login_view.dart';
import 'package:Rover/featuers/login/widgets/text_formfild_custom.dart';
import 'package:Rover/featuers/register/widgets/gender_register_type.dart';
import 'package:Rover/featuers/settings/setting_provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../image_functions.dart';
// import 'package:tutorial_april/utils.dart';

class CompleteProfile extends StatefulWidget {
  static const String routeName = "completeProfile";

  CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  File? pickedImage;
  String? _url;

  
  
  //main السطر دا عشان انادي علي الصفحه دي في ال
  var formKey = GlobalKey<FormState>();

  //(1)
  var NumberCarController = TextEditingController();

  var NumberLicenseCarController = TextEditingController();

  var NumberLicenseDriverController = TextEditingController();

  var  CarIsModelController = TextEditingController();

  var DescriptionController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    var mediaQuary =
        MediaQuery.of(context).size; //reposive لطول والعرض بضبط(mediaQuary)
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40), //اطراف العمود
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.8),
              child: Form(
                //(2)
                key: formKey, //(3)
                child: Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch, /////
                      children: [
                        ////////////1//////////
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: pickedImage == null
                              ? null
                              : FileImage(pickedImage!),
                          child: pickedImage == null
                              ? const Icon(
                                  Icons.person,
                                  size: 80,
                                  color: MyColors.red,
                                )
                              : null,
                        ),
                          Container(
                          height: 40,
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              dialog();
                            },
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: MyColors.red,
                              size: 25,
                            ),
                          ),
                        ),
                        ////////2////////
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: pickedImage == null
                              ? null
                              : FileImage(pickedImage!),
                          child: pickedImage == null
                              ? const Icon(
                                  Icons.person,
                                  size: 80,
                                  color: MyColors.red,
                                )
                              : null,
                        ),
                        Container(
                          height: 40,
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              dialog();
                            },
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: MyColors.red,
                              size: 25,
                            ),
                          ),
                        ),
                    ////////////3///////////////
                          CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: pickedImage == null
                              ? null
                              : FileImage(pickedImage!),
                          child: pickedImage == null
                              ? const Icon(
                                  Icons.person,
                                  size: 80,
                                  color: MyColors.red,
                                )
                              : null,
                        ),
                          Container(
                          height: 40,
                          alignment: Alignment.bottomCenter,
                          child: InkWell(
                            onTap: () {
                              dialog();
                            },
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: MyColors.red,
                              size: 25,
                            ),
                          ),
                        ),
                      
                  /////////////////////////////////////////////////////    
                      
                            //Number Car
                          
                                 TextFormFieldCustom(
                                  labelText: "Number Car",
                                  //  hintText: "Enter Your FullName",
                                  prefixIcon: const Icon(Icons.car_rental),
                                  controller: NumberCarController,
                                  keyboardType: TextInputType.name,
                                  ////////validator//////
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'you must enter your Numder Car';
                                    }
                                  },
                                  /////////////
                                ),
                              
                            
                        ///Sizebox
                        SizedBox(
                          height: mediaQuary.height * .030,
                        ),
                        //Number License Car
                        TextFormFieldCustom(
                          labelText: "Number License Car",
                          hintText: "Enter Number License Car",
                          prefixIcon: Icon(Icons.email),
                          controller: NumberLicenseCarController,
                          keyboardType: TextInputType.number,

                          ////////validator//////
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'you must enter your Number License Car';
                                    }
                                  },
                                  /////////////
                        ),

                        ///Sizebox
                        SizedBox(
                          height: mediaQuary.height * .030,
                        ),
                          //Number License Driver
                        TextFormFieldCustom(
                          labelText: "Number License  Driver",
                          hintText: "Enter Number License Driver",
                          prefixIcon: Icon(Icons.email),
                          controller: NumberLicenseDriverController,
                          keyboardType: TextInputType.number,

                          ////////validator//////
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'you must enter your Number License Driver';
                                    }
                                  },
                      
                        ),

                        ///Sizebox
                        SizedBox(
                          height: mediaQuary.height * .030,
                        ),
                        
                          //Car is Model
                        TextFormFieldCustom(
                          labelText: "Car is Model",
                          hintText: "Car is Model",
                          prefixIcon: Icon(Icons.email),
                          controller: CarIsModelController,
                          keyboardType: TextInputType.emailAddress,

                          ////////validator//////
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'you must enter your Number License Driver';
                                    }
                                  },
                      
                        ),

                        ///Sizebox
                        SizedBox(
                          height: mediaQuary.height * .030,
                        ),
                        //Description
                        TextFormFieldCustom(
                          labelText: "Description",
                          hintText: "Description",
                          prefixIcon: Icon(Icons.email),
                          controller: DescriptionController,
                          keyboardType: TextInputType.emailAddress,

                          ////////validator//////
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'you must enter your Description';
                                    }
                                  },
                      
                        ),

                      
                        ///ElevatedButton
                        ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: NumberLicenseDriverController.text,
                                    password: NumberCarController.text,
                                  );
                                  credential.user!.uid;
                                  FirebaseAuth.instance.currentUser!
                                      .sendEmailVerification();
                                  final imageUrl = await uploadImage(
                                      path:
                                          '${credential.user!.uid}/images/${DateTime.now().toString()}',
                                      file: pickedImage!);

                                  ///Api call credential.user!.uid , data ,imageUrl
                                  Navigator.pushReplacementNamed(
                                      context, LoginView.routeName);
                                } on FirebaseAuthException catch (e) {
                                  print(
                                      'EEEEE================================$e');
                                  if (e.code == 'weak-password') {
                                    debugPrint(
                                        'The password provided is too weak.');
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                      desc:
                                      'The password provided is too weak.',
                                      // btnCancelOnPress: () {},
                                      // btnOkOnPress: () {},
                                    ).show();
                                  } else if (e.code == 'email-already-in-use') {
                                    debugPrint(
                                        'The account already exists for that email.');
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                      desc:
                                      'The account already exists for that email.',
                                      // btnCancelOnPress: () {},
                                      // btnOkOnPress: () {},
                                    ).show();
                                  }
                                } catch (e) {
                                  print(e);
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12),

                              backgroundColor: theme.primaryColor,
                              //shape
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //text
                                Text(
                                  "  Save  ",
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                                //icon
                                //  const Icon(Icons.arrow_forward_outlined),
                              ],
                            )),

                        ///Sizebox
                        SizedBox(
                          height: mediaQuary.height * .020,
                        ),

                      
                      ]),
                ),
              )),
        ),
      ),
    );
  }

  void dialog() {
    showDialog(
        builder: (context) => AlertDialog(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () async {
                            File? temp = await ImageFunctions.cameraPicker();
                            if (temp != null) {
                              pickedImage = temp;
                            }
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            size: 40,
                            color: MyColors.red,
                          )),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(fontSize: 12, color: MyColors.red),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () async {
                            File? temp = await ImageFunctions.galleryPicker();
                            if (temp != null) {
                              pickedImage = temp;
                            }
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.image_outlined,
                            size: 40,
                            color: MyColors.red,
                          )),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Gallary",
                        style: TextStyle(fontSize: 12, color: MyColors.red),
                      ),
                    ],
                  )
                ],
              ),
            ),
        context: context);
  }

  Future<String?> uploadImage({
    required String path,
    required File file,
  }) async {
    try {
      final storage = FirebaseStorage.instance;
      final Reference ref = storage.ref().child(path).child(file.path);
      final val = await ref.putFile(file);
      return await val.ref.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }
}

