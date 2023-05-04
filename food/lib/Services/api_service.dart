import 'dart:convert';

import 'package:http/http.dart';
//import 'package:ui/models/api_model.dart';

import '../models/api_model.dart';

class ApiService {
  Future getapi() async {
    var orga_list = [];
    var path = Uri.parse('http://127.0.0.1:8000/organization/api/');
    var response = await get(path);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map<String, dynamic> item in data) {
        orga_list.add(ApiModel.formJson(item));
      }
    }
    return orga_list;
  }
}
