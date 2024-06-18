import 'dart:convert';

import 'package:Rover/featuers/completeProfile/helper/api.dart';
import 'package:Rover/featuers/completeProfile/model/complete_profile_model.dart';

class SrartTripService {
  static Future<CompleteProfileModel> addTrip({
    required String picture_License,
    required String picture_Car,
    required dynamic license_Car,
    required String model,
    required String description,
    required dynamic carNumber,
    required dynamic userId,
    required dynamic driver_License_Picture,
  }) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await Api().post(
      url: 'http://alaaynassar-001-site1.atempurl.com/api/Car/CreateCar',
      body: jsonEncode({
        'picture_License': picture_License,
        'picture_Car': picture_Car,
        'license_Car': license_Car,
        'model': model,
        'description': description,
        'carNumber': carNumber,
        'userId': userId,
        'driver_License_Picture': driver_License_Picture,
      }),
    );

    return CompleteProfileModel.fromJson(data);
  }
}
