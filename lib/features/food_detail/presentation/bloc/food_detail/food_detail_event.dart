part of 'food_detail_bloc.dart';

abstract class FoodDetailEvent extends Equatable {
  const FoodDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchFoodDetail extends FoodDetailEvent {
  const FetchFoodDetail({required this.idMeal});

  final String idMeal;

  @override
  List<Object> get props => [idMeal];
}

class CheckIsFavoriteFood extends FoodDetailEvent {
  const CheckIsFavoriteFood({required this.idMeal});

  final String idMeal;

  @override
  List<Object> get props => [idMeal];
}

class UpdateIsFavoriteFood extends FoodDetailEvent {}
