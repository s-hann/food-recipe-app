import 'package:equatable/equatable.dart';

class FoodListEntity extends Equatable {
  const FoodListEntity({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  @override
  List<Object?> get props => [strMeal, strMealThumb, idMeal];
}
