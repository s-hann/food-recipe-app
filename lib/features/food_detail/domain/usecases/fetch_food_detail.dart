import 'package:dartz/dartz.dart';
import 'package:msig_assignment_test/core/usecase/usecase.dart';
import 'package:msig_assignment_test/features/food_detail/domain/entities/food_detail_entity.dart';
import 'package:msig_assignment_test/features/food_detail/domain/repositories/food_detail_repository.dart';

class FetchFoodDetailUsecase
    implements Usecase<Either<String, FoodDetailEntity>, String> {
  FetchFoodDetailUsecase({required this.foodDetailRepository});

  final FoodDetailRepository foodDetailRepository;

  @override
  Future<Either<String, FoodDetailEntity>> call({String? params}) {
    return foodDetailRepository.fetchFoodDetail(idMeal: params ?? '');
  }
}
