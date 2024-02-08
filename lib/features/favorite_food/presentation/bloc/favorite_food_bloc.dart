import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:msig_assignment_test/features/favorite_food/domain/usecases/fetch_favorite_food.dart';
import 'package:msig_assignment_test/features/food_detail/domain/entities/food_detail_entity.dart';

part 'favorite_food_event.dart';
part 'favorite_food_state.dart';

class FavoriteFoodBloc extends Bloc<FavoriteFoodEvent, FavoriteFoodState> {
  final FetchFavoriteFoodUsecase fetchFavoriteFoodUsecase;

  FavoriteFoodBloc({
    required this.fetchFavoriteFoodUsecase,
  }) : super(const FavoriteFoodState.initial()) {
    on<FetchFavoriteFood>(_fetchFavoriteFood);
  }

  Future<void> _fetchFavoriteFood(
    FetchFavoriteFood event,
    Emitter<FavoriteFoodState> emit,
  ) async {
    emit(const FavoriteFoodState.loading());
    final result = await fetchFavoriteFoodUsecase.call();
    result.fold(
      (_) => emit(const FavoriteFoodState.failure()),
      (r) => emit(FavoriteFoodState.success(foods: r)),
    );
  }
}
