part of 'favorite_food_bloc.dart';

abstract class FavoriteFoodEvent extends Equatable {
  const FavoriteFoodEvent();

  @override
  List<Object> get props => [];
}

class FetchFavoriteFood extends FavoriteFoodEvent {}
