import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msig_assignment_test/features/food_list/domain/entities/food_list_entity.dart';

import 'package:msig_assignment_test/features/food_list/domain/usecases/fetch_food_list.dart';

part 'food_list_event.dart';
part 'food_list_state.dart';

class FoodListBloc extends Bloc<FoodListEvent, FoodListState> {
  final FetchFoodListUsecase fetchFoodListUsecase;

  FoodListBloc({
    required this.fetchFoodListUsecase,
  }) : super(const FoodListState.initial()) {
    on<FetchFoodList>(_fetchFoodList);
  }

  Future<void> _fetchFoodList(
    FetchFoodList event,
    Emitter<FoodListState> emit,
  ) async {
    emit(const FoodListState.loading());
    final result = await fetchFoodListUsecase.call(params: event.category);
    result.fold(
      (_) => emit(const FoodListState.failure()),
      (r) => emit(FoodListState.success(foodList: r)),
    );
  }
}
