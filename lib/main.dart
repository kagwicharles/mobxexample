import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'state/counter.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MobX Example App'),
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
  final _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Current count is at:',
            ),
            Observer(
                builder: (_) => Text(
                      '${_counter.value}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: _counter.decrement,
                      child: const Icon(
                        Icons.remove,
                        color: Colors.red,
                      ),
                    )),
                const SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    onPressed: _counter.increment,
                    child: const Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
