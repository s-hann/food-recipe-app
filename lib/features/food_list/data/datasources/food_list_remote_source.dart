import 'package:dio/dio.dart';
import 'package:msig_assignment_test/features/food_list/data/models/category_model.dart';
import 'package:msig_assignment_test/features/food_list/data/models/meal_model.dart';
import 'package:msig_assignment_test/core/resource/resource.dart';

abstract class FoodListRemoteSource {
  Future<Resource<MealCategoryModel>> fetchCategories();
  Future<Resource<MealModel>> fetchFoodList({required String category});
}

class FoodListRemoteSourceImpl extends FoodListRemoteSource {
  final _dio = Dio();

  @override
  Future<Resource<MealCategoryModel>> fetchCategories() async {
    try {
      final response = await _dio.get(
        'https://www.themealdb.com/api/json/v1/1/list.php',
        queryParameters: {
          'c': 'list',
        },
      );
      return Resource.fromJson(
        response.data,
        (json) => MealCategoryModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<Resource<MealModel>> fetchFoodList({required String category}) async {
    try {
      final response = await _dio.get(
        'https://www.themealdb.com/api/json/v1/1/filter.php',
        queryParameters: {
          'c': category,
        },
      );
      return Resource.fromJson(
        response.data,
        (json) => MealModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
