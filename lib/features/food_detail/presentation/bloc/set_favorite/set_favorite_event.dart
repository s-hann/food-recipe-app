part of 'set_favorite_bloc.dart';

abstract class AddFavoriteEvent extends Equatable {
  const AddFavoriteEvent();

  @override
  List<Object?> get props => [];
}

class SetFavorite extends AddFavoriteEvent {
  const SetFavorite({
    this.food,
    required this.isFavoriteFood,
  });

  final FoodDetailEntity? food;
  final bool isFavoriteFood;

  @override
  List<Object?> get props => [food, isFavoriteFood];
}
