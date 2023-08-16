import 'package:inventory_app/models/shipments.dart';

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
          "email": "juan@gmail.com",
          "id": 1,
          "isAdmin": true,
          "lastName": "Doe",
          "name": "John",
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
