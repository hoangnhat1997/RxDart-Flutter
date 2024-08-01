import 'package:rxdart/rxdart.dart';

class CounterBloc {
  final _counterSubject = BehaviorSubject<int>.seeded(0);

  // Output stream
  Stream<int> get counterStream => _counterSubject.stream;

  // Function to increment counter
  void increment() {
    _counterSubject.sink.add(_counterSubject.value + 1);
  }

  // Dispose the subject
  void dispose() {
    _counterSubject.close();
  }
}
