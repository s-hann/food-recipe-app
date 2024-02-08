part of 'food_detail_bloc.dart';

enum FoodDetailStatus { initial, loading, success, failure }

class FoodDetailState extends Equatable {
  const FoodDetailState._({
    this.status = FoodDetailStatus.initial,
    this.food,
    this.isFavoriteFood = false,
  });

  final FoodDetailStatus status;
  final FoodDetailEntity? food;
  final bool isFavoriteFood;

  const FoodDetailState.initial() : this._();

  const FoodDetailState.loading() : this._(status: FoodDetailStatus.loading);

  const FoodDetailState.success({required FoodDetailEntity food})
      : this._(status: FoodDetailStatus.success, food: food);

  const FoodDetailState.failure() : this._(status: FoodDetailStatus.failure);

  FoodDetailState copyWith({
    FoodDetailStatus? status,
    FoodDetailEntity? food,
    bool? isFavoriteFood,
  }) {
    return FoodDetailState._(
      status: status ?? this.status,
      food: food ?? this.food,
      isFavoriteFood: isFavoriteFood ?? this.isFavoriteFood,
    );
  }

  @override
  List<Object?> get props => [status, food, isFavoriteFood];
}
