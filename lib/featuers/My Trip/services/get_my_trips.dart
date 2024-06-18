import 'package:Rover/featuers/My Trip/helper/api.dart';

import '../model/My_Ttips_model.dart';

class MyTripService {
  Future<List<MyTtipsModel>> getMyTrip() async {
    List<dynamic> data =
        // ignore: missing_required_param
        await Api()
            .get(url: 'http://alaaynassar-001-site1.atempurl.com/api/trip');

    List<MyTtipsModel> MyTripsList = [];
    for (int i = 0; i < data.length; i++) {
      MyTripsList.add(
        MyTtipsModel.fromJson(data[i]),
      );
    }
    return MyTripsList;
  }
}
