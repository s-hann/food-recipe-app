part of 'food_list_bloc.dart';

enum FoodListStatus { initial, loading, success, failure }

class FoodListState extends Equatable {
  const FoodListState._({
    this.status = FoodListStatus.initial,
    this.foodList = const <FoodListEntity>[],
  });

  final FoodListStatus status;
  final List<FoodListEntity> foodList;

  const FoodListState.initial() : this._();

  const FoodListState.loading() : this._(status: FoodListStatus.loading);

  const FoodListState.success({required List<FoodListEntity> foodList})
      : this._(status: FoodListStatus.success, foodList: foodList);

  const FoodListState.failure() : this._(status: FoodListStatus.failure);

  @override
  List<Object> get props => [status, foodList];
}
