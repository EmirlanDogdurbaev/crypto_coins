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
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 177, 183, 58)),
          primarySwatch: Colors.amber,
          dividerColor: Colors.amber,
          listTileTheme: const ListTileThemeData(iconColor: Colors.amberAccent),
          scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
          textTheme: const TextTheme(
              bodyMedium: TextStyle(
                  color: Color.fromARGB(255, 255, 191, 0), fontSize: 25),
              labelMedium: TextStyle(
                color: Color.fromARGB(139, 255, 191, 0),
                fontSize: 20,
              ))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

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
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, i) => ListTile(
          leading: SvgPicture.asset(
            'assets/svg/bitcoin.svg',
            height: 30,
            width: 30,
          ),
          title: Text(
            "bitcon",
            style: theme.textTheme.bodyMedium,
          ),
          subtitle: Text(
            "1000\$",
            style: theme.textTheme.labelMedium,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
    return scaffold;
  }
}
