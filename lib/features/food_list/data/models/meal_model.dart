class MealModel {
  MealModel({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  final String strMeal;
  final String strMealThumb;
  final String idMeal;

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        strMeal: json['strMeal'],
        strMealThumb: json['strMealThumb'],
        idMeal: json['idMeal'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'strMeal': strMeal,
        'strMealThumb': strMealThumb,
        'idMeal': idMeal,
      };
}
