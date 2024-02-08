import 'package:msig_assignment_test/core/usecase/usecase.dart';
import 'package:msig_assignment_test/features/food_detail/domain/repositories/food_detail_repository.dart';

class CheckIsFavoriteFoodUsecase implements Usecase<bool, String> {
  CheckIsFavoriteFoodUsecase({required this.foodDetailRepository});

  final FoodDetailRepository foodDetailRepository;

  @override
  Future<bool> call({String? params}) {
    return foodDetailRepository.checkIsFavoriteFood(idMeal: params ?? '');
  }
}
