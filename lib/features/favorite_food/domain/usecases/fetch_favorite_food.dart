import 'package:dartz/dartz.dart';
import 'package:msig_assignment_test/core/usecase/usecase.dart';
import 'package:msig_assignment_test/features/favorite_food/domain/repositories/favorite_food_repository.dart';
import 'package:msig_assignment_test/features/food_detail/domain/entities/food_detail_entity.dart';

class FetchFavoriteFoodUsecase
    implements Usecase<Either<String, List<FoodDetailEntity>>, void> {
  FetchFavoriteFoodUsecase({required this.favoriteFoodRepository});

  final FavoriteFoodRepository favoriteFoodRepository;

  @override
  Future<Either<String, List<FoodDetailEntity>>> call({void params}) {
    return favoriteFoodRepository.fetchFavoriteFood();
  }
}
