import 'package:dartz/dartz.dart';
import 'package:msig_assignment_test/features/food_detail/domain/entities/food_detail_entity.dart';

abstract class FavoriteFoodRepository {
  Future<Either<String, List<FoodDetailEntity>>> fetchFavoriteFood();
}
