import 'package:example_bloc/src/blocs/counter_enum.dart';
import 'package:example_bloc/src/blocs/double_counter_block.dart';
import 'package:flutter/material.dart';

class DoublePage extends StatefulWidget {
  DoublePage({Key key}) : super(key: key);

  @override
  _DoublePageState createState() => _DoublePageState();
}

class _DoublePageState extends State<DoublePage> {
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'Button 1',
            onPressed: () =>
                _doubleCounterBlock.sendEvent.add(Counter.DECREMENT),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'Button 2',
            onPressed: () =>
                _doubleCounterBlock.sendEvent.add(Counter.INCREMENT),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
