import 'package:Rover/featuers/Available%20Trips/helper/api.dart';
import 'package:Rover/featuers/Available%20Trips/models/available_model.dart';

class AvailableService {
  Future<List<AvailableModel>> getAvailable() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api().get(
            url:
                'http://alaaynassar-001-site1.atempurl.com/api/trip/Avaliable');

    List<AvailableModel> availablesList = [];
    for (int i = 0; i < data.length; i++) {
      availablesList.add(
        AvailableModel.fromJson(data[i]),
      );
    }
    return availablesList;
  }
}
