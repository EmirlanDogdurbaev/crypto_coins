import 'package:coins_list/features/widgets/widgets.dart';
import 'package:coins_list/repositories/coin_repository/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


class CoinList extends StatefulWidget {
  const CoinList({super.key, required this.title});

  final String title;

  @override
  State<CoinList> createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  List<CoinModel>? _coinList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: (_coinList == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              padding: const EdgeInsets.only(top: 16, bottom: 10),
              itemCount: _coinList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, i) {
                final coin = _coinList![i];
                return CryptoCoinTile(coin: coin);
              }),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _coinList = await GetIt.I<CoinRepository>().getCoinList();
    setState(() {});
  }
}
