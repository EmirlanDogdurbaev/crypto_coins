import 'package:coins_list/router/routes.dart';
import 'package:coins_list/theme/theme.dart';
import 'package:flutter/material.dart';

class CoinApp extends StatelessWidget {
  const CoinApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme,
      routes: routes,
    );
  }
}
