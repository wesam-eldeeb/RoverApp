import 'package:Rover/featuers/config/constants/colors/my_colors.dart';
import 'package:flutter/material.dart';

class ApplacationThemeManger {
  static const Color primary = MyColors.red; //(1)

  /////Light/////////
  static ThemeData lightTheme = ThemeData(
    primaryColor: primary, //(2)
    scaffoldBackgroundColor: Colors.white, //لون الخلفيه الابيض
  );

/*********************************************/
/////////Dark//////////
  static ThemeData darkTheme = ThemeData(
    primaryColor: primary, //(4)
    scaffoldBackgroundColor: const Color(0XFF060E16), //لون الخلفيه الاسود
  );
}
