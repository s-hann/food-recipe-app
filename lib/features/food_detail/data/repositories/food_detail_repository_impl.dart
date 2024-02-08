import 'package:dartz/dartz.dart';

import 'package:msig_assignment_test/core/database/dao/food_detail_dao.dart';
import 'package:msig_assignment_test/features/food_detail/data/datasources/remote/food_detail_remote_source.dart';
import 'package:msig_assignment_test/features/food_detail/domain/entities/food_detail_entity.dart';
import 'package:msig_assignment_test/features/food_detail/domain/repositories/food_detail_repository.dart';

class FoodDetailRepositoryImpl extends FoodDetailRepository {
  FoodDetailRepositoryImpl({
    required this.remoteSource,
    required this.dao,
  });

  final FoodDetailRemoteSource remoteSource;
  final FoodDetailDao dao;

  @override
  Future<Either<String, FoodDetailEntity>> fetchFoodDetail({
    required String idMeal,
  }) async {
    try {
      final result = await remoteSource.fetchFoodDetail(idMeal: idMeal);
      final data = result.meals.first;
      final strIngredients = <String>[];
      final strMeasures = <String>[];
      for (int i = 0; i < 20; i++) {
        if (data.strIngredients[i] != '' && data.strMeasures[i] != '') {
          strIngredients.add(data.strIngredients[i]);
          strMeasures.add(data.strMeasures[i]);
        } else {
          break;
        }
      }
      final entity = FoodDetailEntity(
        idMeal: data.idMeal,
        strMeal: data.strMeal,
        strCategory: data.strCategory,
        strArea: data.strArea,
        strInstructions: data.strInstructions,
        strMealThumb: data.strMealThumb,
        strIngredients: strIngredients,
        strMeasures: strMeasures,
      );
      return Right(entity);
    } catch (_) {
      return const Left('Error');
    }
  }

  @override
  Future<int> addToFavorite({required FoodDetailEntity? food}) {
    if (food != null) {
      return dao.insertFoodDetail(food: food);
    }
    return Future.value(-1);
  }

  @override
  Future<bool> checkIsFavoriteFood({required String idMeal}) async {
    try {
      final result = await dao.getFoodById(idMeal: idMeal);
      if (result != null) return true;
      return false;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<int> removeFromFavorite({required String idMeal}) {
    return dao.deleteFoodDetailById(idMeal: idMeal);
  }
}
