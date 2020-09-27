import 'dart:async';

import 'package:example_bloc/src/blocs/counter_enum.dart';
import 'package:example_bloc/src/blocs/counter_repository.dart';

class DoubleCounterBlock {
  CounterRepository _counterRepository = CounterRepository();
  StreamController<Counter> _input = StreamController();
  StreamController<int> _output = StreamController();

  Stream<int> get counterStream => _output.stream;
  StreamSink<Counter> get sendEvent => _input.sink;

  DoubleCounterBlock() {
    _input.stream.listen(_onEvent);
  }

  void _onEvent(Counter event) {
    if (event == Counter.INCREMENT) {
      _counterRepository.doubleIncrement();
    } else if (event == Counter.DECREMENT) {
      _counterRepository.doubleDecrement();
    }
    _output.add(_counterRepository.get());
  }

  void disponse() {
    _input.close();
    _output.close();
  }
}
