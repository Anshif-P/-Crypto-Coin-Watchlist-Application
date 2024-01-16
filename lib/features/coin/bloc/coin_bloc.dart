import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_app/features/model/model.dart';
import 'package:bloc_app/features/watch_list/added_watch_list/added_watch_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc() : super(CoinInitial()) {
    on<CoinSuccessLoadEvent>(coinSuccessLoadEvent);
    on<WatchListAddEvent>(watchListAddEvent);
    on<WatchListAddedMessageEvent>(watchListAddedMessageEvent);
  }

  FutureOr<void> coinSuccessLoadEvent(
      CoinSuccessLoadEvent event, Emitter<CoinState> emit) async {
    emit(CoinLoaddedState());

    const url =
        'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en';
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      final body = response.body;
      final jsondecode = jsonDecode(body);
      if (response.statusCode == 200) {
        List<CoinModel> coins = [];
        for (int i = 0; i < jsondecode.length; i++) {
          CoinModel coin = CoinModel.fromJson(jsondecode[i]);
          coins.add(coin);
        }
        emit(CoinSuccessState(coins: coins));
      } else {
        emit(CoinErrorState());
      }
    } on SocketException {
      return emit(CoinErrorState());
    } catch (e) {
      return emit(CoinErrorState());
    }
    //
  }

  FutureOr<void> watchListAddEvent(
      WatchListAddEvent event, Emitter<CoinState> emit) {
    watchList.add(event.addedWatchItem);
    emit(WatchListAddSuccessState());
  }

  FutureOr<void> watchListAddedMessageEvent(
      WatchListAddedMessageEvent event, Emitter<CoinState> emit) {
    emit(WatchListAddSuccessState());
  }
}
