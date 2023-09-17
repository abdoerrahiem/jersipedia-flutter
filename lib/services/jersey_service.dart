import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jersipedia/models/jersey_model.dart';
import 'package:jersipedia/utils/constant.dart';

class JerseyService {
  Future<List<JerseyModel>> getHomeJersey() async {
    try {
      final res = await http.get(
        Uri.parse('$baseUrl/jersey?page=1&size=10'),
      );

      if (res.statusCode == 200) {
        return List<JerseyModel>.from(jsonDecode(res.body)['data']
            .map((item) => JerseyModel.fromJson(item)));
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<JerseyModel>> getJersey({
    String title = '',
    num page = 1,
    num size = 10,
    String league = '',
  }) async {
    try {
      final res = await http.get(
        Uri.parse(
          '$baseUrl/jersey?title=$title&page=$page&size=$size&league=$league',
        ),
      );

      if (res.statusCode == 200) {
        return List<JerseyModel>.from(jsonDecode(res.body)['data']
            .map((item) => JerseyModel.fromJson(item)));
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
