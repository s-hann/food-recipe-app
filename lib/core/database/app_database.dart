import 'package:drift/drift.dart';
import 'package:msig_assignment_test/core/database/converter/string_list_converter.dart';
import 'package:msig_assignment_test/core/database/food_detail_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [FoodDetails])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}
