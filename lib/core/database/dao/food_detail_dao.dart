import 'package:drift/drift.dart';
import 'package:msig_assignment_test/core/database/app_database.dart';
import 'package:msig_assignment_test/core/database/food_detail_table.dart';
import 'package:msig_assignment_test/features/food_detail/domain/entities/food_detail_entity.dart';

part 'food_detail_dao.g.dart';

@DriftAccessor(tables: [FoodDetails])
class FoodDetailDao extends DatabaseAccessor<AppDatabase>
    with _$FoodDetailDaoMixin {
  FoodDetailDao(AppDatabase attachedDatabase) : super(attachedDatabase);

  Future<int> insertFoodDetail({
    required FoodDetailEntity food,
  }) {
    return into(foodDetails).insert(
      FoodDetailsCompanion(
        idMeal: Value(food.idMeal),
        strMeal: Value(food.strMeal),
        strCategory: Value(food.strCategory),
        strArea: Value(food.strArea),
        strInstructions: Value(food.strInstructions),
        strMealThumb: Value(food.strMealThumb),
        ingredients: Value(food.strIngredients),
        measures: Value(food.strMeasures),
      ),
    );
  }

  Future<List<FoodDetailEntity>> getAllFoods() async {
    final data = await select(foodDetails).get();
    final foods = <FoodDetailEntity>[];
    for (final result in data) {
      foods.add(
        FoodDetailEntity(
          idMeal: result.idMeal,
          strMeal: '${result.strMeal}',
          strCategory: '${result.strCategory}',
          strArea: '${result.strArea}',
          strInstructions: '${result.strInstructions}',
          strMealThumb: '${result.strMealThumb}',
          strIngredients: result.ingredients ?? [],
          strMeasures: result.measures ?? [],
        ),
      );
    }
    return foods;
  }

  Future<FoodDetailEntity?> getFoodById({required String idMeal}) async {
    final result = await (select(foodDetails)
          ..where((tbl) => tbl.idMeal.equals(idMeal)))
        .getSingle();
    return FoodDetailEntity(
      idMeal: result.idMeal,
      strMeal: '${result.strMeal}',
      strCategory: '${result.strCategory}',
      strArea: '${result.strArea}',
      strInstructions: '${result.strInstructions}',
      strMealThumb: '${result.strMealThumb}',
      strIngredients: result.ingredients ?? [],
      strMeasures: result.measures ?? [],
    );
  }

  Future<int> deleteFoodDetailById({required String idMeal}) {
    return (delete(foodDetails)..where((tbl) => tbl.idMeal.equals(idMeal)))
        .go();
  }
}
