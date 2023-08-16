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
