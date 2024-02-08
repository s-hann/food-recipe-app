part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class FetchCategories extends CategoryEvent {}

class SelectCategory extends CategoryEvent {
  const SelectCategory({
    required this.category,
  });

  final String category;

  @override
  List<Object> get props => [category];
}
