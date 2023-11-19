part of 'coins_list_block.dart';

class CoinListState {}

class CoinListLoaded extends CoinListState {
  CoinListLoaded({required this.cryptosList});
  final List<CoinModel> cryptosList;
}

class CoinListLoading extends CoinListState {}

class CoinListInitial extends CoinListState {}
