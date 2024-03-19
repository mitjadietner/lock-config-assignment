import 'dart:convert';

import 'package:locks/model/lock_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const API_URL =
      'https://run.mocky.io/v3/d5f5d613-474b-49c4-a7b0-7730e8f8f486';

  Future<LockDoor> fetchData() async {
    final response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
      return LockDoor.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch data.');
    }
  }
}
