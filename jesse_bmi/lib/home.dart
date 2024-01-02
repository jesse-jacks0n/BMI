import 'package:flutter/material.dart';

class BodyMassIndex extends StatefulWidget {
  const BodyMassIndex({Key? key}) : super(key: key);

  @override
  State<BodyMassIndex> createState() => _BodyMassIndexState();
}

class _BodyMassIndexState extends State<BodyMassIndex> {

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  double? _bmi;

  String _message = 'Please enter your height and weight';

  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    //check if inputs are in range
    if (height == null || height >= 3.5 || weight == null || weight >= 400) {
      setState(() {
        _message = "Please enter valid data";
        _bmi = null;
      });
      return;
    }

    // Check if the inputs are valid
    if (height <= 0 || weight <= 0) {
      setState(() {
        _message = "Your height and weight must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);

      if (_bmi! < 18.5) {
        _message = "You are underweight 😞";
      } else if (_bmi! < 25) {
        _message = 'You body is fine 😊';
      } else if (_bmi! < 30) {
        _message = 'You are overweight 😢';
      } else {
        _message = 'You are obese 😞';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //backgroundColor:Color(0xffff8f98),
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: Center(
              child: Text(
                _bmi == null ? '--' : _bmi!.toStringAsFixed(2),
                style: const TextStyle(fontSize: 60, color: Colors.white),
                textAlign: TextAlign.center,

              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 60,
            child: Center(
              child: Text(
                _message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: SizedBox(
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  color: Colors.deepPurple.shade200,
                  // color:const Color(0xffffafb6),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                keyboardType:
                                const TextInputType.numberWithOptions(
                                    decimal: true),
                                decoration:
                                const InputDecoration(labelText: 'Height (m)',
                                  border: InputBorder.none,),
                                controller: _heightController,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: TextField(
                                keyboardType:
                                const TextInputType.numberWithOptions(
                                    decimal: true),
                                decoration: const InputDecoration(
                                  labelText: 'Weight (kg)',
                                  border: InputBorder.none,
                                ),
                                controller: _weightController,

                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 70,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple[300],
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)
                                  )
                              ),
                              onPressed: _calculate,
                              child:
                              const Text('Calculate',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),


                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
