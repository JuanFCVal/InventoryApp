import 'package:flutter/material.dart';
import 'package:inventory_app/services/api_service.dart';

import '../models/user.dart';

class SessionProvider extends ChangeNotifier {
  bool _loading = false;
  ApiService apiService = ApiService();
  late User currentUser;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setCurrentUser(User user) {
    currentUser = user;
  }

  isLoading() => _loading;

  Future<bool> validateLogin(String user, String password) async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    setLoading(false);
    final currentUser = apiService.loginUser(user, password);
    if (currentUser != null) {
      setCurrentUser(currentUser);
      return true;
    }
    return false;
  }
}
