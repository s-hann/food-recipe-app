class MealCategoryModel {
  MealCategoryModel({required this.strCategory});

  final String strCategory;

  factory MealCategoryModel.fromJson(Map<String, dynamic> json) =>
      MealCategoryModel(
        strCategory: json['strCategory'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'strCategory': strCategory,
      };
}
