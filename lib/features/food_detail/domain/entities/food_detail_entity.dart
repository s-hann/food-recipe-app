import 'package:equatable/equatable.dart';

class FoodDetailEntity extends Equatable {
  const FoodDetailEntity({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strIngredients,
    required this.strMeasures,
  });

  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final List<String> strIngredients;
  final List<String> strMeasures;

  @override
  List<Object?> get props {
    return [
      idMeal,
      strMeal,
      strCategory,
      strArea,
      strInstructions,
      strMealThumb,
      strIngredients,
      strMeasures,
    ];
  }
}
