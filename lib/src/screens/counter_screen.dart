import 'package:example_bloc/src/blocs/counter_bloc.dart';
import 'package:example_bloc/src/blocs/counter_enum.dart';
import 'package:example_bloc/src/screens/double_screen.dart';
import 'package:example_bloc/src/widgets/floating_actions_widget.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  CounterScreen({Key key}) : super(key: key);

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  CounterBlock _counterBlock = CounterBlock();

  @override
  void dispose() {
    _counterBlock.disponse();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter BloC'),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.trending_up),
            onPressed: () {
              Navigator.of(context)
                  .push(
                    new MaterialPageRoute(
                      builder: (BuildContext context) => DoubleScreen(),
                    ),
                  )
                  .then((_) => _counterBlock.sendEvent.add(Counter.FETCH));
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
                stream: _counterBlock.counterStream,
                initialData: 0,
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
    _counterBlock.sendEvent.add(Counter.INCREMENT);
  }

  _decrement() {
    _counterBlock.sendEvent.add(Counter.DECREMENT);
  }
}
