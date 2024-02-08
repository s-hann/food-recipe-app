import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:msig_assignment_test/features/food_detail/domain/entities/food_detail_entity.dart';
import 'package:msig_assignment_test/features/food_detail/domain/usecases/check_is_favorite_food.dart';
import 'package:msig_assignment_test/features/food_detail/domain/usecases/fetch_food_detail.dart';

part 'food_detail_event.dart';
part 'food_detail_state.dart';

class FoodDetailBloc extends Bloc<FoodDetailEvent, FoodDetailState> {
  final FetchFoodDetailUsecase fetchFoodDetailUsecase;
  final CheckIsFavoriteFoodUsecase checkIsFavoriteFoodUsecase;

  FoodDetailBloc({
    required this.fetchFoodDetailUsecase,
    required this.checkIsFavoriteFoodUsecase,
  }) : super(const FoodDetailState.initial()) {
    on<FetchFoodDetail>(_fetchFoodDetail);
    on<CheckIsFavoriteFood>(_checkIsFavoriteFood);
    on<UpdateIsFavoriteFood>(_updateIsFavoriteFood);
  }

  Future<void> _fetchFoodDetail(
    FetchFoodDetail event,
    Emitter<FoodDetailState> emit,
  ) async {
    emit(const FoodDetailState.loading());
    final result = await fetchFoodDetailUsecase.call(params: event.idMeal);
    result.fold(
      (_) => emit(const FoodDetailState.failure()),
      (r) => emit(FoodDetailState.success(food: r)),
    );
    add(CheckIsFavoriteFood(idMeal: event.idMeal));
  }

  Future<void> _checkIsFavoriteFood(
    CheckIsFavoriteFood event,
    Emitter<FoodDetailState> emit,
  ) async {
    final result = await checkIsFavoriteFoodUsecase.call(params: event.idMeal);
    emit(state.copyWith(isFavoriteFood: result));
  }

  void _updateIsFavoriteFood(
    UpdateIsFavoriteFood event,
    Emitter<FoodDetailState> emit,
  ) {
    emit(state.copyWith(isFavoriteFood: !state.isFavoriteFood));
  }
}
