import 'package:coins_list/repositories/coin_repository/abstract_coins_repos.dart';
import 'package:coins_list/repositories/coin_repository/models/coin_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coins_list_events.dart';
part 'coins_list_state.dart';

class CoinListBlock extends Bloc<CoinListEvent, CoinListState> {
  CoinListBlock(this.coinsRepos) : super(CoinListInitial()) {
    on<LoadCoinList>((event, emit) async {
      final coinsList = await coinsRepos.getCoinList();
      emit(CoinListLoaded(cryptosList: coinsList));
    });
  }

  final AbstractsCoinsRepos coinsRepos;
}
