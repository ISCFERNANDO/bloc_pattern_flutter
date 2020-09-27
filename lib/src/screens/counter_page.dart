import 'package:example_bloc/src/blocs/counter_bloc.dart';
import 'package:example_bloc/src/blocs/counter_enum.dart';
import 'package:example_bloc/src/screens/double_page.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key}) : super(key: key);

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
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
                      builder: (BuildContext context) => DoublePage(),
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            heroTag: 'Button 1',
            onPressed: () => _counterBlock.sendEvent.add(Counter.DECREMENT),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            heroTag: 'Button 2',
            onPressed: () => _counterBlock.sendEvent.add(Counter.INCREMENT),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
