import 'package:dartz/dartz.dart';
import 'package:msig_assignment_test/features/food_list/data/datasources/food_list_remote_source.dart';
import 'package:msig_assignment_test/features/food_list/domain/entities/food_list_entity.dart';
import 'package:msig_assignment_test/features/food_list/domain/repositories/food_list_repository.dart';

class FoodListRepositoryImpl extends FoodListRepository {
  FoodListRepositoryImpl({required this.remoteSource});

  final FoodListRemoteSource remoteSource;

  @override
  Future<Either<String, List<String>>> fetchCategories() async {
    try {
      final result = await remoteSource.fetchCategories();
      final categories = <String>[];
      for (final data in result.meals) {
        categories.add(data.strCategory);
      }
      return Right(categories);
    } catch (_) {
      return const Left('Error');
    }
  }

  @override
  Future<Either<String, List<FoodListEntity>>> fetchFoodList({
    required String category,
  }) async {
    try {
      final result = await remoteSource.fetchFoodList(category: category);
      final foodList = <FoodListEntity>[];
      for (final data in result.meals) {
        foodList.add(
          FoodListEntity(
            strMeal: data.strMeal,
            strMealThumb: data.strMealThumb,
            idMeal: data.idMeal,
          ),
        );
      }
      return Right(foodList);
    } catch (_) {
      return const Left('Error');
    }
  }
}
