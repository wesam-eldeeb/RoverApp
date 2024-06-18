class UserrModel {
  final dynamic id;
  final String userId;
  final String user_Picture;
  final dynamic first_Name;
  final String last_Name;
  final String password;
  final String email;
  final dynamic phone;
  final String gender;
  final dynamic type;

  UserrModel(
      {required this.id,
      required this.userId,
      required this.user_Picture,
      required this.first_Name,
      required this.last_Name,
      required this.password,
      required this.email,
      required this.phone,
      required this.gender,
      required this.type});

  factory UserrModel.fromJson(jsonData) {
    return UserrModel(
      id: jsonData['id'],
      userId: jsonData['userId'],
      user_Picture: jsonData['user_Picture'],
      first_Name: jsonData['first_Name'],
      last_Name: jsonData['last_Name'],
      password: jsonData['password'],
      email: jsonData['email'],
      phone: jsonData['phone'],
      gender: jsonData['gender'],
      type: jsonData['type'],
    );
  }
}
