part of 'favorite_food_bloc.dart';

enum FavoriteFoodStatus { initial, loading, success, failure }

class FavoriteFoodState extends Equatable {
  const FavoriteFoodState._({
    this.status = FavoriteFoodStatus.initial,
    this.foods = const <FoodDetailEntity>[],
  });

  final FavoriteFoodStatus status;
  final List<FoodDetailEntity> foods;

  const FavoriteFoodState.initial() : this._();

  const FavoriteFoodState.loading()
      : this._(status: FavoriteFoodStatus.loading);

  const FavoriteFoodState.success({required List<FoodDetailEntity> foods})
      : this._(status: FavoriteFoodStatus.success, foods: foods);

  const FavoriteFoodState.failure()
      : this._(status: FavoriteFoodStatus.failure);

  @override
  List<Object> get props => [status, foods];
}
