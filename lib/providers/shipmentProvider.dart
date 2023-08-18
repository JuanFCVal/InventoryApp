import 'package:flutter/cupertino.dart';
import 'package:inventory_app/models/shipments.dart';
import 'package:inventory_app/models/stockItem.dart';
import 'package:inventory_app/services/api_service.dart';

class ShipmentProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
  List<Shipment> shipments = [];
  List<StockItem> stockItems = [];
  List<Shipment> getShipment() {
    final response = apiService.getShipments();
    setShipment(response);
    return response;
  }

  setShipment(List<Shipment> shipment) {
    shipments = shipment;
    notifyListeners();
  }

  List<StockItem> getStockItems() {
    final response = apiService.getStockItems();
    stockItems = response;
    return response;
  }
}
