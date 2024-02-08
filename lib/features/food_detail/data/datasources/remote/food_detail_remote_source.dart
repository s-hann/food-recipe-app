import 'package:dio/dio.dart';
import 'package:msig_assignment_test/core/resource/resource.dart';
import 'package:msig_assignment_test/features/food_detail/data/models/food_detail_model.dart';

abstract class FoodDetailRemoteSource {
  Future<Resource<FoodDetailModel>> fetchFoodDetail({required String idMeal});
}

class FoodDetailRemoteSourceImpl extends FoodDetailRemoteSource {
  final _dio = Dio();

  @override
  Future<Resource<FoodDetailModel>> fetchFoodDetail({
    required String idMeal,
  }) async {
    try {
      final response = await _dio.get(
        'https://www.themealdb.com/api/json/v1/1/lookup.php',
        queryParameters: {
          'i': idMeal,
        },
      );
      return Resource.fromJson(
        response.data,
        (json) => FoodDetailModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
