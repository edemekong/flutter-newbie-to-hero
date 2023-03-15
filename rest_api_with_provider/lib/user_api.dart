import 'dart:convert';

import 'package:http/http.dart';
import 'package:rest_api_with_provider/user.dart';

class UserApi {
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com';

  static Future<List<User>> fetchUser() async {
    try {
      const String apiURl = '$_baseUrl/users';
      final Response response = await get(Uri.parse(apiURl));

      final body = jsonDecode(response.body);

      final data = List<Map<String, dynamic>>.from(body);

      final List<User> users = data.map((map) => User.fromMap(map)).toList();

      return users;
    } catch (error) {
      print(error);
    }
    return [];
  }
}
