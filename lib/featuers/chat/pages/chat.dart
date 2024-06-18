import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/chat_screen.dart';

class ChatPage extends StatelessWidget {
  static const String routeName = 'chat_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chat',
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
            color: Colors.red,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // هنا يمكن استبدال الصورة بخريطة حقيقية باستخدام Google Maps أو غيره
                  Image.asset(
                    'assets/images/map-image.jpeg',
                    // استبدل هذا بمكون الخريطة الحقيقية
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 10, // تحديد المسافة من الأسفل
                    child: Container(
                      padding:
                          const EdgeInsets.all(20), // زيادة الهوامش داخل المربع
                      decoration: BoxDecoration(
                        color: Colors.white, // لون الخلفية
                        borderRadius: BorderRadius.circular(
                            40), // جعل حواف المربع دائرية قليلاً
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/profile.png'),
                                radius: 25, // تحديد نصف قطر الدائرة
                              ),
                              const SizedBox(
                                  width:
                                  20), // زيادة المسافة بين الصورة والنصوص
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Richard Hoffman', // الاسم الأول
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                      height: 10), // زيادة المسافة بين العناصر
                                  Text(
                                    'CAR: Toyota AXB94',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                  width:
                                  40), // زيادة الهامش بين النصوص والأيقونات
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      await launchUrl(
                                          Uri.parse(
                                            "https://wa.me/+20${01012488756}",
                                          ),
                                          mode: LaunchMode.externalApplication);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      // Color(0xff013220),
                                      padding: EdgeInsets.all(0),
                                    ),
                                    child: Image.asset(
                                      'assets/images/WhatsApp.png',
                                      fit: BoxFit.contain,
                                      width: 35,
                                    ),
                                  ),
                                  // floatingActionButton : FloatingActionButton(
                                  //       backgroundColor: ColorsManager.darkGreen,
                                  //       child: Image.asset(
                                  //         IconsManager.whatsApp,
                                  //         fit: BoxFit.contain,
                                  //         width: 30.r,
                                  //         color: ColorsManager.white,
                                  //       ),
                                  //       onPressed: () async {
                                  //         await launchUrl(
                                  //             Uri.parse(
                                  //               "https://wa.me/الرقم",
                                  //             ),
                                  //             mode: LaunchMode.externalApplication);
                                  //       }),
                                  const SizedBox(width: 20),
                                  // زيادة المسافة بين الأيقونات
                                  IconButton(
                                    icon: const Icon(Icons.message),
                                    color: Colors.red, // لون الخلفية الأسود
                                    onPressed: () {
                                      User? currentUser =
                                          FirebaseAuth.instance.currentUser;
                                      if (currentUser != null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ChatScreen(user: currentUser),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20), // إضافة مسافة أسفل المربع
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
