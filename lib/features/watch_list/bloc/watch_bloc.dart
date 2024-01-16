import 'dart:async';

import 'package:bloc_app/features/model/model.dart';
import 'package:bloc_app/features/watch_list/added_watch_list/added_watch_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'watch_event.dart';
part 'watch_state.dart';

class WatchBloc extends Bloc<WatchEvent, WatchState> {
  WatchBloc() : super(WatchInitial()) {
    on<WatchSuccessEvent>(watchSuccessEvent);
    on<RemoveItemEvent>(removeItemEvent);
  }

  FutureOr<void> watchSuccessEvent(
      WatchSuccessEvent event, Emitter<WatchState> emit) {
    emit(WatchSuccessState(lists: watchList));
  }

  FutureOr<void> removeItemEvent(
      RemoveItemEvent event, Emitter<WatchState> emit) {
    watchList.removeAt(event.index!);
    emit(RemoveItemState());
    emit(RemoveMessageState());
  }
}
