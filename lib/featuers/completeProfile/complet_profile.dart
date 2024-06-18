// import 'dart:html';
import 'dart:io';

//import 'package:Rover/featuers/config/constants/colors/my_colors.dart';
//import 'package:Rover/featuers/login/widgets/text_formfild_custom.dart';
//import 'package:Rover/featuers/settings/setting_provider.dart';
//import 'package:Rover/image_frame.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/constants/colors/my_colors.dart';
import '../login/widgets/text_formfild_custom.dart';
import '../settings/setting_provider.dart';
//import 'package:provider/provider.dart';
//import 'package:tutorial_april/utils.dart';

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

  var CarIsModelController = TextEditingController();

  var DescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuary =
        MediaQuery.of(context).size; //reposive لطول والعرض بضبط(mediaQuary)
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Complete Profile',
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
              color: MyColors.red,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.white,
        ),
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
                            Column(children: [
                              TextFormFieldCustom(
                                labelText: "Url for your car image",
                                //  hintText: "Enter Your FullName",
                                prefixIcon:
                                    const Icon(Icons.car_rental_outlined),
                                controller: NumberCarController,
                                keyboardType: TextInputType.name,
                                ////////validator//////
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'You must enter your car image ';
                                  }
                                },
                                /////////////
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormFieldCustom(
                                labelText: "Url for your car linces image",
                                //  hintText: "Enter Your FullName",
                                prefixIcon:
                                    const Icon(Icons.car_rental_outlined),
                                controller: NumberCarController,
                                keyboardType: TextInputType.name,
////////validator//////
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'You must enter your car linces image ';
                                  }
                                },
                                /////////////
                              ),
                              SizedBox(height: 10),
                              TextFormFieldCustom(
                                labelText:
                                    "Url for your image of the driver's license",
                                //  hintText: "Enter Your FullName",
                                prefixIcon:
                                    const Icon(Icons.car_rental_outlined),
                                controller: NumberCarController,
                                keyboardType: TextInputType.name,
                                ////////validator//////
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "You must enter image of the driver's license ";
                                  }
                                },
                                /////////////
                              ),
                              //     Text(
                              //       "Upload your car image",
                              //       style: TextStyle(fontSize: 16),
                              //     ),
                              //     SizedBox(
                              //       height: 10,
                              //     ),
                              //     ImageFrame()
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Column(
                              //   children: [
                              //     Text(
                              //       "Upload your car linces image",
                              //       style: TextStyle(fontSize: 16),
                              //     ),
                              //     SizedBox(
                              //       height: 10,
                              //     ),
                              //     ImageFrame()
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              // Column(
                              //   children: [
                              //     Text(
                              //       "Upload your image of the driver's license",
                              //       style: TextStyle(fontSize: 16),
                              //     ),
                              //     SizedBox(
                              //       height: 10,
                              //     ),
                              //     ImageFrame()
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              //Number Car

                              TextFormFieldCustom(
                                labelText: "Car Number",
                                //  hintText: "Enter Your FullName",
                                prefixIcon:
                                    const Icon(Icons.car_rental_outlined),
                                controller: NumberCarController,
                                keyboardType: TextInputType.name,
                                ////////validator//////
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'You must enter your car number ';
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
                                labelText: "Car's License Number ",
                                hintText: "Enter Car's License Number",
                                prefixIcon: Icon(Icons.local_activity),
                                controller: NumberLicenseCarController,
                                keyboardType: TextInputType.number,

                                ////////validator//////
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "you must enter your car's license number";
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
                                labelText: "Driver's License Number",
                                hintText: "Enter Driver's License Number",
                                prefixIcon: Icon(Icons.local_police),
                                controller: NumberLicenseDriverController,
                                keyboardType: TextInputType.number,

                                ////////validator//////
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "you must enter your driver's license number";
                                  }
                                },
                              ),

                              ///Sizebox
                              SizedBox(
                                height: mediaQuary.height * .030,
                              ),

                              //Car is Model
                              TextFormFieldCustom(
                                labelText: "Car Model",
                                hintText: "Car Model",
                                prefixIcon: Icon(Icons.car_crash_outlined),
                                controller: CarIsModelController,
                                keyboardType: TextInputType.emailAddress,

                                ////////validator//////
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'you must enter your car model';
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
                                prefixIcon: Icon(Icons.description),
                                controller: DescriptionController,
                                keyboardType: TextInputType.emailAddress,

                                ////////validator//////
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'you must enter your description';
                                  }
                                },
                              ),
                              SizedBox(
                                height: mediaQuary.height * .030,
                              ),

                              ///ElevatedButton
                              ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      print("validate done");
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(12),

                                    backgroundColor: theme.primaryColor,
                                    //shape
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      //text
                                      Text(
                                        "Save",
                                        style:
                                            theme.textTheme.bodySmall?.copyWith(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  )),
                            ]),
                          ]),
                    )),
              ),
            )));
  }
}
