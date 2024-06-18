import 'package:Rover/featuers/home/helper/api.dart';
import 'package:Rover/featuers/home/model/User_model.dart';

class UpdateUserService {
  Future<UserrModel> updateUser({
    required String userId,
    required String user_Picture,
    required String first_Name,
    required String last_Name,
    required String email,
    required String password,
    required String phone,
    required String gender,
    required dynamic type,
  }) async {
    // ignore: missing_required_param
    Map<String, dynamic> data = await Api().post(
      url: 'http://alaaynassar-001-site1.atempurl.com/api/User/UpdateUser',
      body: {
        'userId': userId,
        'user_Picture': user_Picture,
        'first_Name': first_Name,
        'last_Name': last_Name,
        'email': email,
        'password': password,
        'phone': phone,
        'gender': gender,
        'image': type,
      },
    );

    return UserrModel.fromJson(data);
  }
}
