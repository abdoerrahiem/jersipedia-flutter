import 'dart:convert';

import 'package:jersipedia/models/add_cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:jersipedia/models/cart_model.dart';
import 'package:jersipedia/utils/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CartService {
  Future<String> addCart(AddCartModel data) async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');

      if (token != null) {
        final res = await http.post(
          Uri.parse('$baseUrl/cart'),
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

  Future<List<CartModel>> getMyCart() async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');

      if (token != null) {
        final res = await http.get(
          Uri.parse('$baseUrl/cart'),
          headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );

        if (res.statusCode == 200) {
          return List<CartModel>.from(jsonDecode(res.body)['data']
              .map((item) => CartModel.fromJson(item)));
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

  Future<String> removeMyCart(String id) async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');

      if (token != null) {
        final res = await http.delete(
          Uri.parse('$baseUrl/cart/$id'),
          headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer $token',
          },
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
}
