import 'package:dartz/dartz.dart';
import 'package:msig_assignment_test/features/food_detail/domain/entities/food_detail_entity.dart';

abstract class FoodDetailRepository {
  Future<Either<String, FoodDetailEntity>> fetchFoodDetail({
    required String idMeal,
  });
  Future<bool> checkIsFavoriteFood({required String idMeal});
  Future<int> addToFavorite({required FoodDetailEntity? food});
  Future<int> removeFromFavorite({required String idMeal});
}
