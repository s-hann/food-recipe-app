part of 'set_favorite_bloc.dart';

enum SetFavoriteStatus { initial, loading, success, failure }

class SetFavoriteState extends Equatable {
  const SetFavoriteState._({
    this.status = SetFavoriteStatus.initial,
  });

  final SetFavoriteStatus status;

  const SetFavoriteState.initial() : this._();

  const SetFavoriteState.loading() : this._(status: SetFavoriteStatus.loading);

  const SetFavoriteState.success() : this._(status: SetFavoriteStatus.success);

  const SetFavoriteState.failure() : this._(status: SetFavoriteStatus.failure);

  @override
  List<Object> get props => [status];
}
