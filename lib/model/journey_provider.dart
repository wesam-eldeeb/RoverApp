import 'package:Rover/services/api_service.dart';
import 'package:flutter/material.dart';

import 'journey.dart';

class JourneyProvider with ChangeNotifier {
  Journey? _journey;

  Journey? get journey => _journey;

  void createJourney(Journey journey) {
    _journey = journey;
    notifyListeners();
  }

  Future<void> saveJourney() async {
    if (_journey != null) {
      await ApiService.saveJourney(_journey!);
    }
  }
}
