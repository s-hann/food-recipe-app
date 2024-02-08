import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:msig_assignment_test/features/food_list/domain/usecases/fetch_category.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final FetchCategoryUsecase fetchCategoryUsecase;

  CategoryBloc({
    required this.fetchCategoryUsecase,
  }) : super(const CategoryState()) {
    on<FetchCategories>(_fetchCategories);
    on<SelectCategory>(_selectCategory);
  }

  Future<void> _fetchCategories(
    FetchCategories event,
    Emitter<CategoryState> emit,
  ) async {
    final result = await fetchCategoryUsecase.call();
    result.fold(
      (l) => null,
      (r) => emit(state.copyWith(categories: r)),
    );
  }

  void _selectCategory(SelectCategory event, Emitter<CategoryState> emit) {
    emit(state.copyWith(selected: event.category));
  }
}
