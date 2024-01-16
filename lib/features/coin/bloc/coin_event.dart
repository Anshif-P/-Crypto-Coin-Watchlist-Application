part of 'coin_bloc.dart';

@immutable
abstract class CoinEvent {}

class CoinSuccessLoadEvent extends CoinEvent {}

class WatchListAddEvent extends CoinEvent {
  final CoinModel addedWatchItem;
  WatchListAddEvent({required this.addedWatchItem});
}

class WatchListAddedMessageEvent extends CoinEvent {}

class RefreshEvent extends CoinEvent {}

class AddToWatchList extends CoinEvent {}
