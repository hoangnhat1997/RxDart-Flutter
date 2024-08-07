import 'package:flutter/material.dart';
import 'counter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  final CounterBloc _bloc = CounterBloc();

  CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RxDart Counter'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.counterStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            return Text(
              'Counter: ${snapshot.data}',
              style: const TextStyle(fontSize: 24),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bloc.increment,
        child: const Icon(Icons.add),
      ),
    );
  }

  void dispose() {
    _bloc.dispose();
  }
}
