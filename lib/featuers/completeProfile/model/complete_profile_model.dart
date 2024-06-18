class CompleteProfileModel {
  final dynamic id;
  final String picture_License;
  final String topicture_Car;
  final dynamic license_Car;
  final String model;
  final String description;
  final String carNumber;
  final dynamic userId;
  final dynamic driver_License_Picture;

  CompleteProfileModel({
    this.id,
    required this.picture_License,
    required this.topicture_Car,
    required this.license_Car,
    required this.model,
    required this.description,
    required this.carNumber,
    required this.userId,
    required this.driver_License_Picture,
  });

  factory CompleteProfileModel.fromJson(jsonData) {
    return CompleteProfileModel(
      id: jsonData['id'],
      picture_License: jsonData['picture_License'],
      topicture_Car: jsonData['topicture_Car'],
      license_Car: jsonData['license_Car'],
      model: jsonData['model'],
      description: jsonData['description'],
      carNumber: jsonData['carNumber  '],
      userId: jsonData['userId'],
      driver_License_Picture: jsonData['driver_License_Picture'],
    );
  }
}
