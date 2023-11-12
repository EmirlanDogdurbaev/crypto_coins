import 'package:coins_list/repositories/coin_repository/models/coin_model.dart';
import 'package:dio/dio.dart';

class CoinRepository {
  Future<List<CoinModel>> getCoinList() async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,BNB&tsyms=USD,EUR',
    );

    final data = response.data as Map<String, dynamic>;

    final dataList = data.entries
        .map((e) => CoinModel(
              name: e.key,
              priceInUSD: (e.value as Map<String, dynamic>)['USD'],
            ))
        .toList();

    return dataList;
  }
}
