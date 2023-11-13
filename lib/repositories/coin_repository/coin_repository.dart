import 'package:coins_list/repositories/coin_repository/crypto_coins.dart';
import 'package:dio/dio.dart';

class CoinRepository implements AbstractsCoinsRepos {
  CoinRepository({required this.dio});

  final Dio dio;

  @override
  Future<List<CoinModel>> getCoinList() async {
    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=DOGE,BTC,ETH,BNB,SOL,AVAX,MATIC,XRP,LINK,TIA,USDC&tsyms=USD,EUR',
    );

    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;

    final dataList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)["USD"] as Map<String, dynamic>;
      final price = usdData["PRICE"];
      final imageUrl = usdData["IMAGEURL"];
      return CoinModel(
          name: e.key,
          priceInUSD: price,
          imageUrl: 'https://www.cryptocompare.com/$imageUrl');
    }).toList();

    return dataList;
  }
}
