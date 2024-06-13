class Journey {
  final String from;
  final String to;
  final double price;
  final String time;
  final String startTime;
  final String expectedTime;
  final String date;
  final String driverBirthday;
  final String plateNumber;
  final int seatsAvailable;
  late final int gender;

  Journey({
    required this.from,
    required this.to,
    required this.price,
    required this.time,
    required this.startTime,
    required this.expectedTime,
    required this.date,
    required this.driverBirthday,
    required this.plateNumber,
    required this.seatsAvailable,
    required this.gender,
  });

  Map<String, dynamic> toJson() => {
        'from': from,
        'to': to,
        'price': price,
        'time': time,
        'startTime': startTime,
        'expectedTime': expectedTime,
        'date': date,
        'driverBirthday': driverBirthday,
        'plateNumber': plateNumber,
        'seatsAvailable': seatsAvailable,
        'gender': gender,
      };
}
