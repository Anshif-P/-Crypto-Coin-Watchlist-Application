import 'package:bloc_app/features/coin/bloc/coin_bloc.dart';
import 'package:bloc_app/features/watch_list/ui/screen_watch_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../coin/ui/screen_coin.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 2, 1, 30),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: const Color.fromARGB(255, 2, 1, 30),
              title: const Text(
                'Crypto',
                style: TextStyle(fontSize: 25),
              ),
              centerTitle: true,
              toolbarHeight: 70.0,
              actions: [
                IconButton(
                    onPressed: () {
                      context.read<CoinBloc>().add(CoinSuccessLoadEvent());
                    },
                    icon: const Icon(Icons.refresh))
              ],
            ),
            body: const Column(
              children: [
                TabBar(
                    indicatorColor: Colors.amber,
                    labelColor: Colors.white,
                    tabs: [Tab(text: 'Coin'), Tab(text: 'whislist')]),
                Expanded(
                    child:
                        TabBarView(children: [ScreenCoin(), ScreenWatchList()]))
              ],
            )));
  }
}
