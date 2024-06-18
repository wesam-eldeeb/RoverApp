class StartTripModel {
  final dynamic id;
  final String from;
  final String to;
  final dynamic price;
  final String date;
  final String time;
  final String expected_Arrivale;
  final dynamic seatsAvaliable;
  final dynamic carNumber;
  final dynamic gender;
  final dynamic statusId;
  final dynamic driverId;

  StartTripModel({
    this.id,
    required this.from,
    required this.to,
    required this.price,
    required this.date,
    required this.time,
    required this.expected_Arrivale,
    required this.seatsAvaliable,
    required this.carNumber,
    required this.gender,
    required this.statusId,
    required this.driverId,
  });

  factory StartTripModel.fromJson(jsonData) {
    return StartTripModel(
      id: jsonData['id'],
      from: jsonData['from'],
      to: jsonData['to'],
      price: jsonData['price'],
      date: jsonData['date'],
      time: jsonData['time'],
      expected_Arrivale: jsonData['expected_Arrivale  '],
      seatsAvaliable: jsonData['seatsAvaliable'],
      carNumber: jsonData['carNumber'],
      gender: jsonData['gender'],
      statusId: jsonData['statusId'],
      driverId: jsonData['driverId'],
    );
  }
}
