import 'package:coins_list/repositories/coin_repository/models/coin_model.dart';

abstract class AbstractsCoinsRepos {
  Future<List<CoinModel>> getCoinList();
}
