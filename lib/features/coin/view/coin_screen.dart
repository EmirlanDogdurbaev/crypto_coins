import 'package:flutter/material.dart';

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
        title: Text(coinName ?? '....'),
      ),
    );
  }
}
