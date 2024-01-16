import 'package:bloc_app/features/watch_list/bloc/watch_bloc.dart';
import 'package:bloc_app/features/watch_list/ui/watch_coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenWatchList extends StatefulWidget {
  const ScreenWatchList({super.key});

  @override
  State<ScreenWatchList> createState() => _ScreenWatchListState();
}

class _ScreenWatchListState extends State<ScreenWatchList> {
  @override
  void initState() {
    super.initState();
    context.read<WatchBloc>().add(WatchSuccessEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 1, 30),
      body: BlocConsumer<WatchBloc, WatchState>(
        listenWhen: (previous, current) => current is WatchActionState,
        buildWhen: (previous, current) => current is! WatchActionState,
        listener: (context, state) {
          if (state is RemoveMessageState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Coin Removed')));
          }
        },
        builder: (context, state) {
          if (state is WatchSuccessState) {
            return ListView.builder(
                itemCount: state.lists.length,
                itemBuilder: (context, index) {
                  final data = state.lists[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WatchWidget(coinObj: data, index: index),
                  );
                });
          }
          return const SizedBox();
        },
      ),
    );
  }
}
