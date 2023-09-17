import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jersipedia/models/league_model.dart';
import 'package:jersipedia/utils/constant.dart';

class LeagueService {
  Future<List<LeagueModel>> getLeague() async {
    try {
      final res = await http.get(
        Uri.parse('$baseUrl/league'),
      );

      if (res.statusCode == 200) {
        return List<LeagueModel>.from(jsonDecode(res.body)['data']
            .map((item) => LeagueModel.fromJson(item)));
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
