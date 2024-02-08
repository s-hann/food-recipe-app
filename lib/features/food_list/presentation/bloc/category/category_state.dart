part of 'category_bloc.dart';

class CategoryState extends Equatable {
  const CategoryState({
    this.categories = const <String>[],
    this.selected,
  });

  final List<String> categories;
  final String? selected;

  CategoryState copyWith({
    List<String>? categories,
    String? selected,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      selected: selected ?? this.selected,
    );
  }

  @override
  List<Object?> get props => [categories, selected];
}
