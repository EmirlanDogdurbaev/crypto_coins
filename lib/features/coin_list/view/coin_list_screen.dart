import 'package:coins_list/features/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CoinList extends StatefulWidget {
  const CoinList({super.key, required this.title});

  final String title;

  @override
  State<CoinList> createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, i) {
            const coinName = "bitcoin";
            return const CryptoCoinTile(coinName: coinName);
          }),
    );
    return scaffold;
  }
}

