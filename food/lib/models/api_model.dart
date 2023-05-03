import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';


class ApiModel {
  ApiModel({
    required this.id,
    required this.name,
    //required this.image,
    required this.latitude,
    required this.longitude,
  });

  int id;
  String name;
  Double latitude;
  Double longitude;


  /*factory ApiModel.fromJson(Map<String, dynamic) => ApiModel(
    id: json["id"],
    name: json["name"],
    latitude: json["latitude"],
    longitude: json["longitude"],

  );*/
}
