import 'package:flutter/material.dart';

class HeightContainer extends StatefulWidget {
  final double initialValue;
  final Function(double) onValueChanged;

  const HeightContainer({Key? key, required this.initialValue, required this.onValueChanged})
      : super(key: key);

  @override
  State<HeightContainer> createState() => _HeightContainerState();
}

class _HeightContainerState extends State<HeightContainer> {
  late double _heightValue;

  @override
  void initState() {
    super.initState();
    _heightValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${_heightValue.toInt()}',
            style: TextStyle(fontSize: 40.0),
          ),
          SizedBox(height: 10.0),
          Slider(
            value: _heightValue,
            min: 50.0,
            max: 400.0,
            onChanged: (value) {
              setState(() {
                _heightValue = value;
                widget.onValueChanged(_heightValue);
              });
            },
            activeColor: Theme.of(context).colorScheme.secondary,
            thumbColor: Theme.of(context).colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}