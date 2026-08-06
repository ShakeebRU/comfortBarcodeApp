import 'dart:convert';
import 'package:http/http.dart' as http;

import 'preferences.dart';

class AppConfig {
  static String apiUrl = "";

  static Future<void> load() async {
    final response = await http.get(
      Uri.parse("https://qeplahore.com/andriodapkurl/comfortbarcode.json"),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      apiUrl = json["api_url"];
    }
    Preferences.init().then((prefs) async {
      if (apiUrl.isNotEmpty && apiUrl != prefs.getAppUrl()) {
        print("API URL: $apiUrl");
        await prefs.saveAppUrl(apiUrl);
      }
    });
  }
}
