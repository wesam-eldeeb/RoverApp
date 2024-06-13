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

class RegisterView extends StatefulWidget {
  static const String routeName = "Register";

  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  File? pickedImage;
  String? _url;

  // Uint8List? _image;

  // Future<void> selectImage() async {
  //   Uint8List img = await pickImage(ImageSource.gallery);
  //   setState(() {
  //     _image = img;
  //   });
  // }

  // void saveImage() async {
  //   String resp = await StoreData().saveData(file: _image!);
  // }

  // File? image;
  // String? _url;

  //   getImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? imageCamera = await picker.pickImage(
  //       source: ImageSource.camera);
  //
  //   image = File(imageCamera!.path);
  //   setState(() {
  //
  //   });
  // }
  //main السطر دا عشان انادي علي الصفحه دي في ال
  var formKey = GlobalKey<FormState>();

  //(1)
  var FirstNameController = TextEditingController();

  var LastNameController = TextEditingController();

  var EamilController = TextEditingController();

  var PasswordController = TextEditingController();

  var ConfirmPasswordController = TextEditingController();
  var PhoneNumberController = TextEditingController();

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
                        // _image != null
                        //     ? CircleAvatar(
                        //         radius: 70,
                        //         backgroundImage: MemoryImage(_image!),
                        //       )
                        //     :
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
                        // Positioned(
                        //   child: IconButton(
                        //     onPressed: () {
                        //       selectImage();
                        //     },
                        //     icon: Icon(Icons.add_a_photo),
                        //   ),
                        //   bottom: 10,
                        //   left: 80,
                        // ),

                        //         MaterialButton(onPressed: ()async {
                        //            await getImage();
                        //         },
                        //             child: Text('Upload Image')),
                        // if(image !=null) Image.file(image!),
                        // SizedBox(
                        //   width: 8,
                        // ),
                        // ElevatedButton(onPressed: () {
                        //   loadImage(context);
                        // },
                        //     child: Text('Load Image')),

                        // Image.asset(
                        //   "assets/images/newRover.png",
                        //   height: mediaQuary.height * .19,
                        // ),
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
                        //       Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: <Widget>[
                        //     Builder(
                        //       builder: (context) => ElevatedButton(
                        //         onPressed: () {
                        //           uploadImage(context);
                        //         },
                        //         child: Text('Upload Image'),
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       width: 10,
                        //     ),
                        //     ElevatedButton(
                        //       onPressed: loadImage,
                        //       child: Text('Load Image'),
                        //     )
                        //   ],
                        // ),
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
                                  //  hintText: "Enter Your FullName",
                                  prefixIcon: const Icon(Icons.person),
                                  controller: FirstNameController,
                                  keyboardType: TextInputType.name,
                                  ////////validator//////
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'you must enter your name';
                                    }
                                  },
                                  /////////////
                                ),
                              ),
                            ),

                            //Last Name
                            Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 3),
                              child: SizedBox(
                                width: mediaQuary.width * 0.35,
                                child: TextFormFieldCustom(
                                  labelText: "last Name",
                                  //  hintText: "Enter Your FullName",
                                  prefixIcon: const Icon(Icons.person),
                                  controller: LastNameController,
                                  keyboardType: TextInputType.name,
                                  ////////validator//////
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'you must enter your name';
                                    }
                                  },
                                  /////////////
                                ),
                              ),
                            ),
                          ],
                        ),

                        ///Sizebox
                        SizedBox(
                          height: mediaQuary.height * .030,
                        ),
                        //Email
                        TextFormFieldCustom(
                          labelText: "Email",
                          hintText: "Enter Your Email",
                          prefixIcon: Icon(Icons.email),
                          controller: EamilController,
                          keyboardType: TextInputType.emailAddress,

                          //////////validator//////////
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'you must enter your email';
                            }
                            var regex = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if (!regex.hasMatch(value)) {
                              return "Invaild email";
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          },
                          /////////////////////////
                        ),

                        ///Sizebox
                        SizedBox(
                          height: mediaQuary.height * .030,
                        ),
                        //password

                        TextFormFieldCustom(
                          labelText: "password",
                          hintText: "Enter Your password",
                          prefixIcon: const Icon(Icons.remove_red_eye),
                          controller: PasswordController,
                          keyboardType: TextInputType.visiblePassword,

                          obscureText: true,
                          /////////////
                          //  onChange:(){PasswordController.text},

                          //////////validator//////////
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'you must enter your password';
                            }
                            var regex = RegExp(
                                r"^(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-z])(?=.*[a-z]).*$");
                            if (!regex.hasMatch(value)) {
                              return "the password must include at least \n* one Lower case letter,\n* one Uper case ,\n* one diget,\n* one specail character \n* at Least 8 characters long.";
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          }, /////////////////////
                        ),

                        ///Sizebox
                        SizedBox(
                          height: mediaQuary.height * .030,
                        ),
                        //confirm Password

                        TextFormFieldCustom(
                          labelText: "Confirm password",
                          hintText: "Enter Your password",
                          prefixIcon: const Icon(Icons.remove_red_eye),
                          controller: ConfirmPasswordController,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,

                          //////////validator//////////
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'you must enter your password';
                            }
                            if (value != PasswordController.text) {
                              return "Password Not Matched";
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            print(value);
                          }, /////////////////////
                        ),

                        ///Sizebox
                        SizedBox(
                          height: mediaQuary.height * .030,
                        ),
                        TextFormFieldCustom(
                          labelText: "Phone Number",
                          hintText: "Enter Your phoneNumber",
                          prefixIcon: const Icon(Icons.mobile_friendly_rounded),
                          controller: PhoneNumberController,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: mediaQuary.height * .030,
                        ),

                        ////////Gender////////////
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: GenderSelectionRegister(),
                          // child: Column(
                          //   children: [
                          // const  Padding(
                          //     padding: EdgeInsets.only(right: 200),
                          //     child: Text(

                          //               'Gender : ',
                          //               style: TextStyle(fontWeight: FontWeight.w400),
                          //             ),
                          //   ),
                          //     Row(
                          //       children: [
                          //         Padding(
                          //           padding: const EdgeInsets.only(right: 25),
                          //           child: Row(
                          //             children: [
                          //           const    Icon(Icons.male),
                          //               GenderField(["male"]),
                          //             ],
                          //           ),
                          //         ),

                          //         Row(
                          //           children: [
                          //         const    Icon(Icons.female),
                          //             GenderField(["female"]),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ],
                          // ),
                        ),
                        //sizebox
                        const SizedBox(
                          height: 5,
                        ),

                        ///ElevatedButton
                        ElevatedButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                try {
                                  final credential = await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: EamilController.text,
                                    password: PasswordController.text,
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
                                  "Create Account",
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

                        //Have an Account
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginView.routeName);
                          }, //(4)
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Have an Account? ",
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                              Text("LOGIN",
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    color: MyColors.red,
                                  ))
                            ],
                          ),
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

