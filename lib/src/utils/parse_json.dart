import 'package:flutter/services.dart' show rootBundle;

Future<String> loadFromAssets(String jsonPath) async {
  return await rootBundle.loadString(jsonPath);
}
