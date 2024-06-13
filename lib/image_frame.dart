import 'dart:io';

import 'package:flutter/material.dart';

import 'featuers/config/constants/colors/my_colors.dart';
import 'image_functions.dart';

class ImageFrame extends StatefulWidget {
  ImageFrame({super.key});

  @override
  State<ImageFrame> createState() => _ImageFrameState();
}

class _ImageFrameState extends State<ImageFrame> {
  File? pickedImage;

  String? _url;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(6), // زوايا مربعة
          ),
          child: pickedImage == null
              ? Icon(
                  Icons.car_crash,
                  size: 50,
                  color: MyColors.red,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(8), // زوايا مربعة
                  child: Image.file(
                    pickedImage!,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        Container(
          height: 40,
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () {
              diaalog();
            },
            child: Icon(
              Icons.camera_alt_outlined,
              color: MyColors.red,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  void diaalog() {
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
                  ),
                ),
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
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  "Gallery",
                  style: TextStyle(fontSize: 12, color: MyColors.red),
                ),
              ],
            )
          ],
        ),
      ),
      context: context,
    );
  }
}
