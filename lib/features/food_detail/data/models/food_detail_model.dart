class FoodDetailModel {
  FoodDetailModel({
    required this.idMeal,
    required this.strMeal,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    this.strTags,
    this.strYoutube,
    required this.strIngredients,
    required this.strMeasures,
    this.strSource,
  });

  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final List<String> strIngredients;
  final List<String> strMeasures;
  final String? strSource;

  factory FoodDetailModel.fromJson(Map<String, dynamic> json) {
    return FoodDetailModel(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strTags: json['strTags'],
      strYoutube: json['strYoutube'],
      strIngredients: List<String>.generate(
        20,
        (index) => json['strIngredient${index + 1}'] ?? '',
      ),
      strMeasures: List<String>.generate(
        20,
        (index) => json['strMeasure${index + 1}'] ?? '',
      ),
      strSource: json['strSource'],
    );
  }
}
