import 'package:coins_list/features/widgets/widgets.dart';
import 'package:coins_list/repositories/coin_repository/coin_repository.dart';
import 'package:coins_list/repositories/coin_repository/models/coin_model.dart';
import 'package:flutter/material.dart';

class CoinList extends StatefulWidget {
  const CoinList({super.key, required this.title});

  final String title;

  @override
  State<CoinList> createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  List<CoinModel>? _coinList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: (_coinList == null)
          ? const SizedBox()
          : ListView.separated(
              itemCount: _coinList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _coinList![i];
                final coinName = coin.name;
                return  CryptoCoinTile(coinName: coinName);
              }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () async {
          _coinList = await CoinRepository().getCoinList();
          setState(() {});
        },
      ),
    );
  }
}
