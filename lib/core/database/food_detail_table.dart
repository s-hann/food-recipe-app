import 'package:drift/drift.dart';
import 'package:msig_assignment_test/core/database/converter/string_list_converter.dart';

@DataClassName('FoodDetail')
class FoodDetails extends Table {
  TextColumn get idMeal => text()();
  TextColumn get strMeal => text().nullable()();
  TextColumn get strCategory => text().nullable()();
  TextColumn get strArea => text().nullable()();
  TextColumn get strInstructions => text().nullable()();
  TextColumn get strMealThumb => text().nullable()();
  TextColumn get ingredients =>
      text().map(const StringListConverter())();
  TextColumn get measures =>
      text().map(const StringListConverter())();
}
