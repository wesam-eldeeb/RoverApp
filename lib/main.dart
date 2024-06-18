import 'package:Rover/cache_helper.dart';
import 'package:Rover/featuers/chat/pages/chat.dart';
import 'package:Rover/featuers/config/constants/applacation_theme_manger.dart';
import 'package:Rover/featuers/settings/setting_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'featuers/Apis/Trip/model/journey_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  CacheHelper.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => SettingProvider()),
      ChangeNotifierProvider(create: (context) => JourneyProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
// @override
  @override
  Widget build(BuildContext context) {
    var mediaQuary = MediaQuery.of(context).size;
    var vm = Provider.of<SettingProvider>(context);
    resizeToAvoidBottomInset:
    false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: vm.currentTheme,
      theme: ApplacationThemeManger.lightTheme,
      darkTheme: ApplacationThemeManger.darkTheme,

      // initialRoute: SplashView.routeName,
      // routes: {
      //   SplashView.routeName: (context) => const SplashView(),
      //   LoginView.routeName: (context) => LoginView(),
      //   RegisterView.routeName: (context) => RegisterView(),
      //   HomeMapView.routeName: (context) => HomeMapView(),
      //   // ChatPage.routeName: (context) => ChatPage(user: ),
      //
      //   // VerivicationView.routeName: (context) => VerivicationView(),
      // },
      // home: FirebaseAuth.instance.currentUser != null &&
      //         FirebaseAuth.instance.currentUser!.emailVerified
      //     ? HomeMapView()
      //     : LoginView(),

// home:CompleteProfile(),
      //    home: HomeMapView(),
//  home: LoginView(),
//home: RegisterView(),
//home: AskAndAnswerPage(),
// home:DetailsPage(),

      // home: AskAndAnswer(),
      home: ChatPage(),
//     home: ChatScreen(user: FirebaseAuth.instance.currentUser!),
//home: HowToUse(),
    );
  }
}
