part of 'food_list_bloc.dart';

sealed class FoodListEvent extends Equatable {
  const FoodListEvent();

  @override
  List<Object> get props => [];
}

class FetchFoodList extends FoodListEvent {
  const FetchFoodList({required this.category});

  final String category;

  @override
  List<Object> get props => [category];
}
