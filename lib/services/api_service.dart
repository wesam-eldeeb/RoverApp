// TODO Implement this library.
import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/journey.dart';

class ApiService {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://alaaynassar-001-site1.atempurl.com/api/',
    headers: {
      'Authorization':
          'Basic ' + base64Encode(utf8.encode('11178361:60-dayfreetrial')),
    },
  ));

  static Future<void> saveJourney(Journey journey) async {
    try {
      final response = await _dio.post('trip', data: journey.toJson());
      if (response.statusCode == 200) {
        print('Journey saved successfully');
      } else {
        print('Failed to save journey');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
