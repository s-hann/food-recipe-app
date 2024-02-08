import 'dart:convert';

import 'package:drift/drift.dart';

class StringListConverter extends TypeConverter<List<String>?, String> {
  const StringListConverter();

  @override
  List<String>? fromSql(String? fromDb) {
    if (fromDb == null) return null;
    final decoded = json.decode(fromDb) as List<dynamic>;
    return decoded.cast<String>();
  }

  @override
  String toSql(List<String>? value) {
    return json.encode(value);
  }
}
