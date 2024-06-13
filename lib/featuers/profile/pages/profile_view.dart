import 'dart:io';

import 'package:Rover/featuers/config/constants/colors/my_colors.dart';
import 'package:Rover/featuers/login/widgets/text_formfild_custom.dart';
import 'package:Rover/featuers/profile/widgets/gender_profile.dart';
import 'package:Rover/featuers/settings/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../image_functions.dart';

class ProfileView extends StatefulWidget {
  static const String routeName = "Profile";

  ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  File? pickedImage;

  String? _url;

  //main السطر دا عشان انادي علي الصفحه دي في ال
  var formKey = GlobalKey<FormState>();

  //(1)
  var FirstNameController = TextEditingController();

  var LastNameController = TextEditingController();

  var PhoneNumberController = TextEditingController();

  var OtherPhoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuary =
        MediaQuery.of(context).size; //reposive لطول والعرض بضبط(mediaQuary)
    var theme = Theme.of(context);
    var vm = Provider.of<SettingProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //SizedBox
                          SizedBox(
                            height: mediaQuary.height * .040,
                          ),
                          //image
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: pickedImage == null
                                ? null
                                : FileImage(pickedImage! as File),
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
                                daiilog();
                              },
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: MyColors.red,
                                size: 25,
                              ),
                            ),
                          ),

                          //SizedBox
                          SizedBox(
                            height: mediaQuary.height * .020,
                          ),
                          //Edit Profile Picture
                          const Text(
                            "Edit Profile Picture",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              //fontStyle: FontStyle.italic
                            ),
                          ),
                          //SizedBox
                          SizedBox(
                            height: mediaQuary.height * .060,
                          ),
                          Row(
                            children: [
                              //First Name
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: SizedBox(
                                  width: mediaQuary.width * 0.35,
                                  child: TextFormFieldCustom(
                                    labelText: "First Name",
                                    prefixIcon: const Icon(Icons.person),
                                    controller: FirstNameController,
                                    keyboardType: TextInputType.name,
                                    ////////validator//////
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'you must enter your name';
                                      }
                                    },
                                    /////////////
                                  ),
                                ),
                              ),
                              //spacer
                              const Spacer(),
                              //Last Name
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: SizedBox(
                                  width: mediaQuary.width * 0.35,
                                  child: TextFormFieldCustom(
                                    labelText: "last Name",
                                    prefixIcon: const Icon(Icons.person),
                                    controller: LastNameController,
                                    keyboardType: TextInputType.name,
                                    ////////validator//////
                                    validator: (value) {
                                      if (value == null ||
                                          value.trim().isEmpty) {
                                        return 'you must enter your name';
                                      }
                                    },
                                    /////////////
                                  ),
                                ),
                              ),
                            ],
                          ),

                          //SizedBox
                          SizedBox(
                            height: mediaQuary.height * .025,
                          ),
                          //Phone Number
                          TextFormFieldCustom(
                            labelText: "Phone Number",
                            hintText: "Enter Your phoneNumber",
                            prefixIcon:
                                const Icon(Icons.mobile_friendly_rounded),
                            controller: PhoneNumberController,
                            keyboardType: TextInputType.phone,
                          ),

                          ///Sizebox
                          SizedBox(
                            height: mediaQuary.height * .025,
                          ),
                          //Other Phone Number
                          TextFormFieldCustom(
                            labelText: "Other Phone Number",
                            hintText: "Enter Your Other Phone Number ",
                            prefixIcon: const Icon(Icons.phone),
                            controller: OtherPhoneNumberController,
                            keyboardType: TextInputType.phone,
                          ),

                          ///Sizebox
                          SizedBox(
                            height: mediaQuary.height * .025,
                          ),
                          ////////Gender////////////
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                          ),
                          //Gender
                          GenderSelectionProfile(),

                          //Sizebox
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
                                    borderRadius: BorderRadius.circular(10.0)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //text
                                  Text(
                                    "Edit",
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              )),
                        ]),
                  ),
                )),
          ),
        ));
  }

  void daiilog() {
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
}
