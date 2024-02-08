import 'package:dartz/dartz.dart';
import 'package:msig_assignment_test/core/database/dao/food_detail_dao.dart';
import 'package:msig_assignment_test/features/favorite_food/domain/repositories/favorite_food_repository.dart';
import 'package:msig_assignment_test/features/food_detail/domain/entities/food_detail_entity.dart';

class FavoriteFoodRepositoryImpl extends FavoriteFoodRepository {
  FavoriteFoodRepositoryImpl({required this.dao});

  final FoodDetailDao dao;

  @override
  Future<Either<String, List<FoodDetailEntity>>> fetchFavoriteFood() async {
    try {
      final data = await dao.getAllFoods();
      return Right(data);
    } catch (_) {
      return const Left('Error');
    }
  }
}
