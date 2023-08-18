import 'package:inventory_app/models/shipments.dart';
import 'package:inventory_app/models/stockItem.dart';

import '../models/user.dart';

class ApiService {
  List<User> getUsers() {
    final data = {
      "users": [
        {
          "email": "jhon@doe.com",
          "id": 1,
          "isAdmin": true,
          "lastName": "Doe",
          "name": "John",
          "password": "123456",
          "profilePicture":
              "https://upload.wikimedia.org/wikipedia/commons/a/a0/Pierre-Person.jpg",
          "username": "johndoe"
        },
        {
          "email": "paul@gmail.com",
          "id": 1,
          "isAdmin": true,
          "lastName": "Sánchez",
          "name": "Paul",
          "password": "1234",
          "profilePicture":
              "https://upload.wikimedia.org/wikipedia/commons/a/a0/Pierre-Person.jpg",
          "username": "johndoe"
        }
      ]
    };
    List<Map<String, Object>>? usersData = data["users"];
    List<User> users = [];
    for (final user in usersData!) {
      users.add(User.fromJson(user));
    }
    return users;
  }

  List<Shipment> getShipments() {
    final data = {
      "shipments": [
        {
          "date": "15-06-2023",
          "hour": "15:00",
          "id": 1,
          "name": "Insumos",
          "driver": "Jhon DOe",
          "profilePicture":
              "https://cdn.aarp.net/content/dam/aarp/auto/2021/03/1140-man-driving-a-car.jpg",
        },
        {
          "date": "10-02-2023",
          "hour": "10:00",
          "id": 2,
          "name": "Medicamentos",
          "driver": "Fernando Valarezo",
          "profilePicture":
              "https://cdn.becomeopedia.com/wp-content/uploads/Bus-Driver.jpg",
        },
        {
          "date": "09-08-2023",
          "hour": "20:00",
          "id": 1,
          "name": "Cargamento",
          "driver": "Paúl Sánchez",
          "profilePicture":
              "https://www.teamais.net/wp-content/uploads/2020/07/driver-hire-min.jpg",
        },
      ]
    };
    List<Map<String, Object>>? shipments = data["shipments"];
    List<Shipment> shipmentsList = [];
    for (final shipment in shipments!) {
      shipmentsList.add(Shipment.fromJson(shipment));
    }
    return shipmentsList;
  }

  List<StockItem> getStockItems() {
    final data = {
      "items": [
        {
          "name": "Paracetamol",
          "quantity": 10,
          "expirationDate": "10-10-2021",
          "lot": "123456",
          "category": "Medicamento",
        },
        {
          "name": "Ibuprofeno",
          "quantity": 20,
          "expirationDate": "15-11-2022",
          "lot": "789012",
          "category": "Medicamento",
        },
        {
          "name": "Aspirina",
          "quantity": 5,
          "expirationDate": "05-07-2023",
          "lot": "345678",
          "category": "Medicamento",
        },
        {
          "name": "Ampolla A",
          "quantity": 30,
          "expirationDate": "20-03-2024",
          "lot": "123111",
          "category": "Ampolla",
        },
        {
          "name": "Ampolla B",
          "quantity": 15,
          "expirationDate": "25-05-2023",
          "lot": "222333",
          "category": "Ampolla",
        },
        {
          "name": "Naproxeno",
          "quantity": 8,
          "expirationDate": "10-10-2023",
          "lot": "444555",
          "category": "Medicamento",
        },
        {
          "name": "Diclofenaco",
          "quantity": 18,
          "expirationDate": "15-11-2024",
          "lot": "666777",
          "category": "Medicamento",
        },
        {
          "name": "Acetaminofén",
          "quantity": 3,
          "expirationDate": "05-07-2022",
          "lot": "888999",
          "category": "Medicamento",
        },
        {
          "name": "Ampolla C",
          "quantity": 28,
          "expirationDate": "20-03-2025",
          "lot": "101112",
          "category": "Ampolla",
        },
        {
          "name": "Ampolla D",
          "quantity": 12,
          "expirationDate": "25-05-2024",
          "lot": "131415",
          "category": "Ampolla",
        },
      ]
    };
    List<Map<String, Object>>? items = data["items"];
    List<StockItem> itemsStock = [];
    for (final item in items!) {
      itemsStock.add(StockItem.fromJson(item));
    }
    return itemsStock;
  }

  User? loginUser(String email, String password) {
    try {
      final users = getUsers();
      final user = users.firstWhere(
        (User element) =>
            element.email == email && element.password == password,
      );

      return user;
    } catch (e) {
      return null;
    }
  }
}
