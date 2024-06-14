import 'package:Rover/featuers/profile/pages/profile_view.dart';
import 'package:Rover/featuers/startJourny/widgets/gender_journy_type.dart';
import 'package:flutter/material.dart';


class DetailsPage extends StatefulWidget {
  static const String routeName = "details_page";

  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int? _genderValue;

  // تعريف دالة buildLabel لعرض البيانات
  Widget buildLabel(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(height: 5.0),
        Text(
          value,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.red),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Details',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  // عند الضغط على الأيقونة، يتم الانتقال إلى صفحة الملف الشخصي
                  return ProfileView();
                }),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.png'),
            ),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20.0),
              buildLabel('From', 'New York, USA'),
              const SizedBox(height: 20.0),
              buildLabel('To', 'Los Angeles, USA'),
              const SizedBox(height: 20.0),
              buildLabel('Price', 'EGP2000'),
              const SizedBox(height: 20.0),
              buildLabel('StartTime', '3:00 PM'),
              const SizedBox(height: 20.0),
                buildLabel('ExpectedTime', '7:00 PM'),
              const SizedBox(height: 20.0),
              buildLabel('Date', '2024-05-03'),
              const SizedBox(height: 20.0),
              buildLabel('Plate Number', 'ABC123'),
              const SizedBox(height: 20.0),
              buildLabel('Seats available', '2'),
              const SizedBox(height: 20.0),
              GenderSelection(
                key: UniqueKey(), // لضمان إعادة تعيين الحالة عندما يتغير المفتاح
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}














