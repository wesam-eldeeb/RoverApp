class AvailableModel {
  final dynamic id;
  final String from;
  final String to;
  final dynamic price;
  final String date;
  final String time;
  final dynamic seatsAvaliable;
  final String driver_Picture;
  final String driver_Name;

  AvailableModel({
    required this.id,
    required this.from,
    required this.to,
    required this.price,
    required this.date,
    required this.time,
    required this.seatsAvaliable,
    required this.driver_Picture,
    required this.driver_Name,
  });

  factory AvailableModel.fromJson(jsonData) {
    return AvailableModel(
      id: jsonData['id'],
      from: jsonData['from'],
      to: jsonData['to'],
      price: jsonData['price'],
      date: jsonData['date'],
      time: jsonData['time'],
      seatsAvaliable: jsonData['seatsAvaliable'],
      driver_Picture: jsonData['driver_Picture'],
      driver_Name: jsonData['driver_Name'],
    );
  }
}
