part of 'watch_bloc.dart';

abstract class WatchState {}

abstract class WatchActionState extends WatchState {}

final class WatchInitial extends WatchState {}

class WatchSuccessState extends WatchState {
  List<CoinModel> lists = [];
  WatchSuccessState({required this.lists});
}

class RemoveItemState extends WatchState {}

class RemoveMessageState extends WatchActionState {}
