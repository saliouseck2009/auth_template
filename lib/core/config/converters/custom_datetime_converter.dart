import 'package:json_annotation/json_annotation.dart';

class CustomDateTimeConverter implements JsonConverter<DateTime, String> {
  const CustomDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    // Si le JSON contient un ".", ex: 2025-04-10T12:34:56.789Z,
    // on retire le dernier caractère ("Z") avant le parse
    if (json.contains(".")) {
      // Retire seulement le 'Z' final
      if (json.endsWith("Z")) {
        json = json.substring(0, json.length - 1);
      }
    }
    return DateTime.parse(json);
  }

  @override
  String toJson(DateTime json) => json.toIso8601String();
}
