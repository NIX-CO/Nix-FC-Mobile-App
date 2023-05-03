import 'dart:convert';
import 'package:http/http.dart';

//import 'package:ui/models/api_model.dart';

class ApiService {
  Future getapi() async {
    var organisation_list = [];
    var path = Uri.parse("http://10.0.2.2:8000/organization/api/");
    var response = await get(path);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for(Map<String, dynamic> item in data){
       // organisation_list.add(ApiModel.fromJson(item))
      }
    }
    return organisation_list;
  }
}
