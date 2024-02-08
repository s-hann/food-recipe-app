import 'package:msig_assignment_test/core/usecase/usecase.dart';
import 'package:msig_assignment_test/features/food_detail/domain/repositories/food_detail_repository.dart';

class RemoveFromFavoriteUsecase implements Usecase<int, String> {
  RemoveFromFavoriteUsecase({required this.foodDetailRepository});

  final FoodDetailRepository foodDetailRepository;

  @override
  Future<int> call({String? params}) {
    return foodDetailRepository.removeFromFavorite(idMeal: params ?? '');
  }
}
