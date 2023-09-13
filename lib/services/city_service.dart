import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jersipedia/models/city_model.dart';
import 'package:jersipedia/utils/constant.dart';

class CityService {
  Future<List<CityModel>> getProvince(String id) async {
    try {
      final res = await http.get(
        Uri.parse('$baseUrl/raja-ongkir/city/$id'),
      );

      if (res.statusCode == 200) {
        return List<CityModel>.from(jsonDecode(res.body)['data']
            .map((item) => CityModel.fromJson(item)));
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
