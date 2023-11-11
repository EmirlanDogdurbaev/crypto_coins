import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          primarySwatch: Colors.amber,
          dividerColor: Colors.amber,
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 60, 255, 0),
            titleTextStyle: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          listTileTheme: const ListTileThemeData(iconColor: Colors.amberAccent),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  color: Color.fromARGB(255, 255, 191, 0), fontSize: 25),
              labelMedium: TextStyle(
                color: Color.fromARGB(139, 255, 191, 0),
                fontSize: 20,
              ))),
      routes: {
        '/': (context) => const CoinList(
              title: "hello",
            ),
        '/coin': (context) => const CryptoCoin()
      },
    );
  }
}

class CoinList extends StatefulWidget {
  const CoinList({super.key, required this.title});

  final String title;

  @override
  State<CoinList> createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var scaffold = Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, i) {
            const coinName = "bitcoin";
            return ListTile(
              leading: SvgPicture.asset(
                'assets/svg/bitcoin.svg',
                height: 30,
                width: 30,
              ),
              title: Text(
                coinName,
                style: theme.textTheme.bodyMedium,
              ),
              subtitle: Text(
                "1000\$",
                style: theme.textTheme.labelMedium,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/coin', arguments: coinName);
              },
            );
          }),
    );
    return scaffold;
  }
}

class CryptoCoin extends StatefulWidget {
  const CryptoCoin({super.key});

  @override
  State<CryptoCoin> createState() => _CryptoCoinState();
}

class _CryptoCoinState extends State<CryptoCoin> {
  String? coinName;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(
        args != null && args is String, "you must provided String arguments");
    coinName = args as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '..'),
      ),
    );
  }
}
