import 'package:example_bloc/src/blocs/counter_enum.dart';
import 'package:example_bloc/src/blocs/double_counter_block.dart';
import 'package:example_bloc/src/widgets/floating_actions_widget.dart';
import 'package:flutter/material.dart';

class DoubleScreen extends StatefulWidget {
  DoubleScreen({Key key}) : super(key: key);

  @override
  _DoubleScreenState createState() => _DoubleScreenState();
}

class _DoubleScreenState extends State<DoubleScreen> {
  DoubleCounterBlock _doubleCounterBlock = DoubleCounterBlock();

  @override
  void dispose() {
    _doubleCounterBlock.disponse();
    super.dispose();
  }

  @override
  void initState() {
    _doubleCounterBlock.sendEvent.add(Counter.FETCH);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter BloC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
                stream: _doubleCounterBlock.counterStream,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionsWidget(
        _decrement,
        _increment,
      ),
    );
  }

  _increment() {
    _doubleCounterBlock.sendEvent.add(Counter.INCREMENT);
  }

  _decrement() {
    _doubleCounterBlock.sendEvent.add(Counter.DECREMENT);
  }
}
