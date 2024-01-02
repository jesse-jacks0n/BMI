import 'package:flutter/material.dart';

class WeightIncrementDecrement extends StatefulWidget {
  final int initialValue;
  final Function(int) onValueChanged;

  WeightIncrementDecrement({Key? key, required this.initialValue, required this.onValueChanged})
      : super(key: key);

  @override
  _WeightIncrementDecrementState createState() => _WeightIncrementDecrementState();
}

class _WeightIncrementDecrementState extends State<WeightIncrementDecrement> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  // Method to get the current weight value
  int getWeightValue() {
    return _value;
  }

  void _increment() {
    setState(() {
      if (_value < 500) {
        _value++;
        widget.onValueChanged(_value);
      }
    });
  }

  void _decrement() {
    setState(() {
      if (_value > 5) {
        _value--;
        widget.onValueChanged(_value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(10);
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: _decrement,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: const Icon(
                Icons.remove,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              '$_value',
              style: const TextStyle(fontSize: 30.0),
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
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}