import 'package:flutter/cupertino.dart';
import 'package:inventory_app/models/shipments.dart';
import 'package:inventory_app/services/api_service.dart';

class ShipmentProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
  List<Shipment> shipments = [];
  List<Shipment> getShipment() {
    final response = apiService.getShipments();
    shipments = response;
    return response;
  }
}
