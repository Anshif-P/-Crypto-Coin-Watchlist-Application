import 'package:bloc_app/features/model/model.dart';
import 'package:bloc_app/features/watch_list/bloc/watch_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchWidget extends StatelessWidget {
  const WatchWidget({required this.coinObj, required this.index});
  final CoinModel coinObj;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(75, 255, 255, 255),
          borderRadius: BorderRadius.circular(7)),
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '#${coinObj.rank.toString()}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  ),
                )),
            Expanded(
                flex: 2,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(coinObj.image))),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          flex: 1,
                          child: SizedBox(
                            child: Text(
                              coinObj.symbol,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18),
                            ),
                          ))
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: ListTile(
                    title: Text(
                      coinObj.name,
                      maxLines: 1,
                      overflow: null,
                      style: const TextStyle(color: Colors.white, fontSize: 19),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "\$" + coinObj.price.toString(),
                        maxLines: 1,
                        overflow: null,
                        style: const TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                )),
            Expanded(
                flex: 3,
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        coinObj.priceChange_24h.toString(),
                        maxLines: 1,
                        overflow: null,
                        style: TextStyle(
                            color: coinObj.priceChange_24h < 0
                                ? const Color.fromARGB(255, 255, 0, 0)
                                : Colors.green,
                            fontWeight: FontWeight.w400,
                            fontSize: 19),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                context
                                    .read<WatchBloc>()
                                    .add(RemoveItemEvent(index: index));
                                context
                                    .read<WatchBloc>()
                                    .add(WatchSuccessEvent());
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              )),
                          const Text(
                            'Remove',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
