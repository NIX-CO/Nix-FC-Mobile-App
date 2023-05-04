import 'dart:convert';
import 'dart:ffi';

class ApiModel {
  ApiModel({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  String id;
  String name;
  Double latitude;
  Double longitude;

  factory ApiModel.formJson(Map<String, dynamic> json) => ApiModel(
      id: json["id"],
      name: json["name"],
      latitude: json["latitude"],
      longitude: json["longitude"]);
}
