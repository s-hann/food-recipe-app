import 'package:dartz/dartz.dart';
import 'package:msig_assignment_test/core/usecase/usecase.dart';
import 'package:msig_assignment_test/features/food_list/domain/repositories/food_list_repository.dart';

class FetchCategoryUsecase
    implements Usecase<Either<String, List<String>>, void> {
  FetchCategoryUsecase({required this.foodRepository});

  final FoodListRepository foodRepository;

  @override
  Future<Either<String, List<String>>> call({void params}) {
    return foodRepository.fetchCategories();
  }
}
