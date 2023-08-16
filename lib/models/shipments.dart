// To parse this JSON data, do
//
//     final Shipment = ShipmentFromJson(jsonString);

import 'dart:convert';

List<Shipment> ShipmentFromJson(String str) =>
    List<Shipment>.from(json.decode(str).map((x) => Shipment.fromJson(x)));

String ShipmentToJson(List<Shipment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Shipment {
  String date;
  String hour;
  int id;
  String name;
  String driver;
  String profilePicture;

  Shipment({
    required this.date,
    required this.hour,
    required this.id,
    required this.name,
    required this.driver,
    required this.profilePicture,
  });

  factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
        date: json["date"],
        hour: json["hour"],
        id: json["id"],
        name: json["name"],
        driver: json["driver"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "hour": hour,
        "id": id,
        "name": name,
        "driver": driver,
        "profilePicture": profilePicture,
      };
}
