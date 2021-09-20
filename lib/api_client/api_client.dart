import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oonstagram/documents/configuration.dart';

class ApiClient {

  final url = "http://127.0.0.1:8080";

  Future<Configuration> getConfigurations() async {
    final http.Response response = await http.get("${this.url}/config");

    if (response.statusCode == 200) {
      return Configuration.fromJson(jsonDecode(response.body));
    }

    throw Exception("failed to get configurations");
  }

}