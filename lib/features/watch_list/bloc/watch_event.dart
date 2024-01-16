part of 'watch_bloc.dart';

abstract class WatchEvent {}

class WatchSuccessEvent extends WatchEvent {}

class RemoveItemEvent extends WatchEvent {
  final int? index;
  RemoveItemEvent({required this.index});
}
