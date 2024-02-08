class Resource<T> {
  Resource({
    required this.meals,
  });

  List<T> meals;

  factory Resource.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      Resource<T>(
        meals: (json['meals'] as List<dynamic>)
            .map((e) => fromJsonT(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson(
    Resource<T> instance,
    Object Function(List<T>? value) toJsonT,
  ) =>
      <String, dynamic>{
        'meals': toJsonT(instance.meals),
      };
}
