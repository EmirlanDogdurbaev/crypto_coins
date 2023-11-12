import 'package:coins_list/features/coin/coin.dart';
import 'package:coins_list/features/coin_list/coin_list.dart';

final routes = {
  '/': (context) => const CoinList(
        title: "Crypto List",
      ),
  '/coin': (context) => const CryptoCoin()
};
