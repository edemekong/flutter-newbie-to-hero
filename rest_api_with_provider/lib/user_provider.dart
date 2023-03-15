import 'package:flutter/material.dart';
import 'package:rest_api_with_provider/user.dart';
import 'package:rest_api_with_provider/user_api.dart';

enum HomeState { initial, loading, loaded }

class UserProvider extends ChangeNotifier {
  List<User> users = [];

  UserProvider() {
    _fetchUsers();
  }

  void _fetchUsers() async {
    users = await UserApi.fetchUser();
    notifyListeners();
  }
}
