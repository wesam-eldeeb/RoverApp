import 'dart:convert';

import 'package:Rover/featuers/startJourny/model/start_trip_model.dart';

import '../helper/api.dart';

class SrartTripService {
  static Future<StartTripModel> addTrip({
    required String from,
    required String to,
    required dynamic price,
    required String date,
    required String time,
    required dynamic expected_Arrivale,
    required dynamic seatsAvaliable,
    required dynamic carNumber,
    required dynamic gender,
    String? statusId,
    required String driverId,
  }) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await Api().post(
      url: 'http://alaaynassar-001-site1.atempurl.com/api/Trip/create',
      body: jsonEncode({
        'from': from,
        'to': to,
        'price': price,
        'date': date,
        'time': time,
        'expected_Arrivale': expected_Arrivale,
        'seatsAvaliable': seatsAvaliable,
        'gender': gender,
        'carNumber': carNumber,
        'statusId': statusId,
        'driverId': driverId,
      }),
    );

    return StartTripModel.fromJson(data);
  }
}
