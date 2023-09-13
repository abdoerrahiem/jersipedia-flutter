import 'dart:convert';

import 'package:jersipedia/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:jersipedia/models/update_password_model.dart';
import 'package:jersipedia/models/update_photo_profile_model.dart';
import 'package:jersipedia/models/update_profile_model.dart';
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

  Future<String> updateProfile(UpdateProfileModel data) async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');

      if (token != null) {
        final res = await http.put(
          Uri.parse('$baseUrl/user/me'),
          headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode(data.toJson()),
        );

        if (res.statusCode == 200) {
          return jsonDecode(res.body)['message'];
        } else {
          throw jsonDecode(res.body)['message'];
        }
      } else {
        throw 'Please relogin.';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> updatePhotoProfile(UpdatePhotoProfileModel data) async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');

      if (token != null) {
        var request =
            http.MultipartRequest('PUT', Uri.parse('$baseUrl/user/me/photo'));
        request.files.add(
            await http.MultipartFile.fromPath('image', data.uri.toString()));
        request.headers.addAll({'Authorization': 'Bearer $token'});
        var res = await request.send();

        if (res.statusCode == 200) {
          return 'Your photo updated.';
        } else {
          throw res.reasonPhrase!;
        }
      } else {
        throw 'Please relogin.';
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> updatePassword(UpdatePasswordModel data) async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');

      if (token != null) {
        final res = await http.put(
          Uri.parse('$baseUrl/user/me/password'),
          headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode(data.toJson()),
        );

        if (res.statusCode == 200) {
          return jsonDecode(res.body)['message'];
        } else {
          throw jsonDecode(res.body)['message'];
        }
      } else {
        throw 'Please relogin.';
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
          UserModel user = UserModel.fromJson(jsonDecode(res.body)['user']);
          user = user.copyWith(id: jsonDecode(res.body)['user']['_id']);
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
