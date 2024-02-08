import 'package:msig_assignment_test/core/usecase/usecase.dart';
import 'package:msig_assignment_test/features/food_detail/domain/entities/food_detail_entity.dart';
import 'package:msig_assignment_test/features/food_detail/domain/repositories/food_detail_repository.dart';

class AddToFavoriteUsecase implements Usecase<int, FoodDetailEntity> {
  AddToFavoriteUsecase({required this.foodDetailRepository});

  final FoodDetailRepository foodDetailRepository;

  @override
  Future<int> call({FoodDetailEntity? params}) {
    return foodDetailRepository.addToFavorite(food: params);
  }
}
