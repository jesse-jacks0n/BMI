import 'package:flutter/material.dart';

class AgeIncrementDecrement extends StatefulWidget {
  @override
  _AgeIncrementDecrementState createState() => _AgeIncrementDecrementState();
}

class _AgeIncrementDecrementState extends State<AgeIncrementDecrement> {
  int _value = 20;

  void _increment() {
    setState(() {
      if (_value < 120) {
        _value++;
      }
    });
  }

  void _decrement() {
    setState(() {
      if (_value > 5) {
        _value--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(10);
    return  Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: _decrement,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: Icon(
                Icons.remove,
                color: Colors.black, // Change the color as desired
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              '$_value',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: _increment,

            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                color: Colors.black, // Change the color as desired
              ),
            ),
          ),
        ),
      ],
    );
  }
}