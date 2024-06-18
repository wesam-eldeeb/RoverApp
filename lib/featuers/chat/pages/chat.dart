import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/image/map-image.jpeg',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 0, // تحديد المسافة من الأسفل
                    child: Container(
                      padding:
                          const EdgeInsets.all(20), // زيادة الهوامش داخل المربع
                      decoration: BoxDecoration(
                        color: Colors.white, // لون الخلفية
                        borderRadius: BorderRadius.circular(
                            20), // جعل حواف المربع دائرية قليلاً
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/image/profile.jpg'),
                                radius: 30, // تحديد نصف قطر الدائرة
                              ),
                              const SizedBox(
                                  width:
                                      20), // زيادة المسافة بين الصورة والنصوص
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'John', // الاسم الأول
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                      height: 10), // زيادة المسافة بين العناصر
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Icon(Icons.star, color: Colors.yellow),
                                      Text('(3 تقييم)'),
                                    ],
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
                                  IconButton(
                                    icon: const Icon(Icons.phone),
                                    color: Colors.red, // لون الخلفية الأحمر
                                    onPressed: () {
                                      // إضافة الإجراء عند الضغط على الأيقونة
                                    },
                                  ),
                                  const SizedBox(
                                      width: 20), // زيادة المسافة بين الأيقونات
                                  IconButton(
                                    icon: const Icon(Icons.message),
                                    color: Colors.black, // لون الخلفية الأسود
                                    onPressed: () {
                                      // إضافة الإجراء عند الضغط على الأيقونة
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
