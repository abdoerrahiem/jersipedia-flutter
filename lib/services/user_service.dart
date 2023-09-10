import 'dart:convert';

import 'package:jersipedia/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:jersipedia/models/user_model.dart';
import 'package:jersipedia/utils/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserService {
  Future<String> login(LoginModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/user/login'),
        headers: {'content-type': 'application/json'},
        body: json.encode(data.toJson()),
      );

      if (res.statusCode == 200) {
        String token = jsonDecode(res.body)['token'];
        const storage = FlutterSecureStorage();
        await storage.write(key: 'token', value: token);
        return token;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getCurrentUser() async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');

      if (token != null) {
        final res = await http.get(
          Uri.parse('$baseUrl/user/me'),
          headers: {'Authorization': 'Bearer $token'},
        );

        if (res.statusCode == 200) {
          UserModel user = jsonDecode(res.body)['user'];
          return user;
        } else {
          throw jsonDecode(res.body)['message'];
        }
      } else {
        throw '';
      }
    } catch (e) {
      rethrow;
    }
  }
}
