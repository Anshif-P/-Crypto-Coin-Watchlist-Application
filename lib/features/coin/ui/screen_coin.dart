import 'package:bloc_app/features/coin/bloc/coin_bloc.dart';
import 'package:bloc_app/features/coin/ui/coin_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenCoin extends StatefulWidget {
  const ScreenCoin({super.key});

  @override
  State<ScreenCoin> createState() => _ScreenCoinState();
}

class _ScreenCoinState extends State<ScreenCoin> {
  @override
  void initState() {
    super.initState();
    context.read<CoinBloc>().add(CoinSuccessLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 1, 30),
      body: BlocConsumer<CoinBloc, CoinState>(
        listenWhen: (previous, current) => current is CoinStateActionState,
        buildWhen: (previous, current) => current is! CoinStateActionState,
        listener: (context, state) {
          if (state is WatchListAddSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added Successfully')));
          }
        },
        builder: (context, state) {
          if (state is CoinSuccessState) {
            return SizedBox(
              child: ListView.builder(
                  itemCount: state.coins.length,
                  itemBuilder: (context, index) {
                    final data = state.coins[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: CoinWidget(coinObj: data),
                    );
                  }),
            );
          } else if (state is CoinLoaddedState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CoinErrorState) {
            return Center(
                child: Text(
              state.error.toString(),
              style: const TextStyle(color: Colors.white),
            ));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
