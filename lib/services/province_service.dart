import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jersipedia/models/province_model.dart';
import 'package:jersipedia/utils/constant.dart';

class ProvinceService {
  Future<List<ProvinceModel>> getProvince() async {
    try {
      final res = await http.get(
        Uri.parse('$baseUrl/raja-ongkir/province'),
      );

      if (res.statusCode == 200) {
        return List<ProvinceModel>.from(jsonDecode(res.body)['data']
            .map((item) => ProvinceModel.fromJson(item)));
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
