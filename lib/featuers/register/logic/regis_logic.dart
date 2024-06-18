import 'dart:convert';

import 'package:Rover/core/api_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class RegisLogic {
  final Dio dio;

  RegisLogic({required this.dio});

  Future<void> regisData({
    required String userId,
    required String imageUrl,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required int gender,
  }) async {
    final url = 'http://alaaynassar-001-site1.atempurl.com/api/user';
// doneeeeeeeeeeeeeeeeee دا معناه انو مشغل الكود دا  مطبعش ال
    // ف دا دليل انو لو الاكونت موجود هيدخل في ال catch ومش هيبعت الداتا في الداتا بيز بتعتكم
    // تمام كده يا شباب  ؟
    debugPrint('doneeeeeeeeeeeeeeeeee');
    var data = json.encode({
      "userId": userId,
      "user_Picture": imageUrl,
      "first_Name": firstName,
      "last_Name": lastName,
      "password": password,
      "email": email,
      "phone": phone,
      "gender": gender,
      "type": 1
    });

    try {
      final response = await dio.post(
        url,
        data: data,
        options: Options(
          headers: <String, String>{
            'authorization': ApiConstant.basicAuth,
          },
        ),
      );
    } catch (e) {
      debugPrint('Request failed with error: $e');
    }
  }
}
