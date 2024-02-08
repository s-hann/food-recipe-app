import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:msig_assignment_test/features/food_detail/domain/entities/food_detail_entity.dart';
import 'package:msig_assignment_test/features/food_detail/domain/usecases/add_to_favorite.dart';
import 'package:msig_assignment_test/features/food_detail/domain/usecases/remove_from_favorite.dart';

part 'set_favorite_event.dart';
part 'set_favorite_state.dart';

class SetFavoriteBloc extends Bloc<AddFavoriteEvent, SetFavoriteState> {
  final AddToFavoriteUsecase addToFavoriteUsecase;
  final RemoveFromFavoriteUsecase removeFromFavoriteUsecase;

  SetFavoriteBloc({
    required this.addToFavoriteUsecase,
    required this.removeFromFavoriteUsecase,
  }) : super(const SetFavoriteState.initial()) {
    on<SetFavorite>(_setFavorite);
  }

  Future<void> _setFavorite(
    SetFavorite event,
    Emitter<SetFavoriteState> emit,
  ) async {
    emit(const SetFavoriteState.loading());
    try {
      final food = event.food;
      if (event.isFavoriteFood) {
        await removeFromFavoriteUsecase.call(params: event.food?.idMeal);
        emit(const SetFavoriteState.success());
      } else {
        await addToFavoriteUsecase.call(params: food);
        emit(const SetFavoriteState.success());
      }
    } catch (_) {
      emit(const SetFavoriteState.failure());
    }
  }
}
