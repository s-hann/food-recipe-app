import 'package:dartz/dartz.dart';
import 'package:msig_assignment_test/core/usecase/usecase.dart';
import 'package:msig_assignment_test/features/food_list/domain/entities/food_list_entity.dart';
import 'package:msig_assignment_test/features/food_list/domain/repositories/food_list_repository.dart';

class FetchFoodListUsecase
    implements Usecase<Either<String, List<FoodListEntity>>, String> {
  FetchFoodListUsecase({required this.foodListRepository});

  final FoodListRepository foodListRepository;

  @override
  Future<Either<String, List<FoodListEntity>>> call({String? params}) {
    return foodListRepository.fetchFoodList(category: params ?? '');
  }
}
