import 'dart:convert';

import 'package:Rover/featuers/Apis/helper/api.dart';
import 'package:http/http.dart';




class AllCategoriesService {
  //[list of dynamic ]responseعملت ال
  Future<List<dynamic>> getAllData() async {
    //end pointبتاع هذه ال[Url]وحطيت [get]نوعه(response)اخت ال
  List<dynamic> data  = await
         Api().get(url:'');
  

    return data;
  }
}
