import 'package:flutter/material.dart';

class FloatingActionsWidget extends StatelessWidget {
  final Function _decrementAction;
  final Function _incrementAction;

  const FloatingActionsWidget(this._decrementAction, this._incrementAction,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          heroTag: 'Button 1',
          onPressed: () => _decrementAction(),
          tooltip: 'Decrement',
          child: Icon(Icons.remove),
        ),
        SizedBox(width: 16),
        FloatingActionButton(
          heroTag: 'Button 2',
          onPressed: () => _incrementAction(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
