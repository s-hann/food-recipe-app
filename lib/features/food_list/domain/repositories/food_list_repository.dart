import 'package:dartz/dartz.dart';
import 'package:msig_assignment_test/features/food_list/domain/entities/food_list_entity.dart';

abstract class FoodListRepository {
  Future<Either<String, List<String>>> fetchCategories();
  Future<Either<String, List<FoodListEntity>>> fetchFoodList({
    required String category,
  });
}
