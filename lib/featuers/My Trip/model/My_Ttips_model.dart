class MyTtipsModel {
  final dynamic id;
  final String from;
  final String to;
  final dynamic price;
  final String date;
  final String time;

  MyTtipsModel({
    required this.id,
    required this.from,
    required this.to,
    required this.price,
    required this.date,
    required this.time,
  });

  factory MyTtipsModel.fromJson(jsonData) {
    return MyTtipsModel(
      id: jsonData['id'],
      from: jsonData['from'],
      to: jsonData['to'],
      price: jsonData['price'],
      date: jsonData['date'],
      time: jsonData['time'],
    );
  }
}
