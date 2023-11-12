import 'package:coins_list/coin_list_app.dart';
import 'package:coins_list/repositories/coin_repository/crypto_coins.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerLazySingleton(() => CoinRepository(dio: Dio()));
  runApp(const CoinApp());
}
