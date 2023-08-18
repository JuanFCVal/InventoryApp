// To parse this JSON data, do
//
//     final stockItem = stockItemFromJson(jsonString);

import 'dart:convert';

List<StockItem> stockItemFromJson(String str) =>
    List<StockItem>.from(json.decode(str).map((x) => StockItem.fromJson(x)));

String stockItemToJson(List<StockItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StockItem {
  String name;
  int quantity;
  String expirationDate;
  String lot;
  String category;

  StockItem({
    required this.name,
    required this.quantity,
    required this.expirationDate,
    required this.lot,
    required this.category,
  });

  factory StockItem.fromJson(Map<String, dynamic> json) => StockItem(
        name: json["name"],
        quantity: json["quantity"],
        expirationDate: json["expirationDate"],
        lot: json["lot"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "expirationDate": expirationDate,
        "lot": lot,
        "category": category,
      };
}
