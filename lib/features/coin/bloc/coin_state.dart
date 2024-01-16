part of 'coin_bloc.dart';

abstract class CoinState {}

abstract class CoinStateActionState extends CoinState {}

class CoinLoaddedState extends CoinState {}

class CoinSuccessState extends CoinState {
  List<CoinModel> coins = [];
  CoinSuccessState({required this.coins});
}

class CoinErrorState extends CoinState {
  String error = 'NetWork Error';
}

class WatchListAddSuccessState extends CoinStateActionState {}

final class CoinInitial extends CoinState {}
