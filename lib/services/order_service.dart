import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jersipedia/models/add_order_model.dart';
import 'package:jersipedia/models/check_ongkir_model.dart';
import 'package:jersipedia/models/ongkir_model.dart';
import 'package:jersipedia/models/order_history_model.dart';
import 'package:jersipedia/utils/constant.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OrderService {
  Future<OngkirModel> checkOngkir(CheckOngkirModel data) async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');

      if (token != null) {
        final res = await http.post(
          Uri.parse('$baseUrl/raja-ongkir/check-ongkir'),
          headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode(data.toJson()),
        );

        if (res.statusCode == 200) {
          return OngkirModel.fromJson(jsonDecode(res.body)['data']);
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

  Future<String> addOrder(AddOrderModel data) async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');

      if (token != null) {
        final res = await http.post(
          Uri.parse('$baseUrl/order'),
          headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: json.encode(data.toJson()),
        );

        if (res.statusCode == 200) {
          return jsonDecode(res.body)['data'];
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

  Future<List<OrderHistoryModel>> getOrders() async {
    try {
      const storage = FlutterSecureStorage();
      String? token = await storage.read(key: 'token');

      if (token != null) {
        final res = await http.get(
          Uri.parse('$baseUrl/order'),
          headers: {
            'content-type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );

        if (res.statusCode == 200) {
          return List<OrderHistoryModel>.from(jsonDecode(res.body)['data']
              .map((item) => OrderHistoryModel.fromJson(item)));
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
