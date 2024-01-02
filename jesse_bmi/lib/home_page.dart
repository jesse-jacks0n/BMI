import 'package:flutter/material.dart';
import 'package:jesse_bmi/components/age.dart';
import 'package:jesse_bmi/result_screen.dart';
import 'components/app_bar.dart';
import 'components/height_container.dart';
import 'components/weight.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Variables to store initial height and weight values
  double _initialHeightValue = 150.0;
  int _initialWeightValue = 50;

  bool _isMaleSelected = false;
  bool _isFemaleSelected = false;

  void _calculateBMI() {
    // Extract height and weight values from the widgets
    double heightInCm = _getHeightInCm();
    int weightInKg = _getWeightInKg();

    // Calculate BMI
    double heightInMeters = heightInCm / 100;
    double bmi = weightInKg / (heightInMeters * heightInMeters);

    String messageTitle;
    String message1;
    String message2;
    String messageContent1;
    String messageContent2;

    if (bmi < 18.5) {
      messageTitle = 'Underweight';
      message1 = 'Eat More Calories';
      message2 = 'Include high-calorie foods like nuts, avocados, and healthy oils';
      messageContent1 = 'Increase portion sizes during meals';
      messageContent2 = 'Add complex carbohydrates (whole grains, sweet potatoes) for sustained energy';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      messageTitle = 'Normal';
      message1 = 'Maintain a Healthy Lifestyle';
      message2 = 'Stay active and eat a balanced diet';
      messageContent1 = 'Include fruits, vegetables, and lean proteins in your meals';
      messageContent2 = 'Engage in regular exercise for overall well-being';
    } else if (bmi >= 25 && bmi < 29.9) {
      messageTitle = 'Overweight';
      message1 = 'Focus on Weight Management';
      message2 = 'Implement healthy habits for a healthy weight';
      messageContent1 = 'Monitor portion sizes and avoid excessive calorie intake';
      messageContent2 = 'Incorporate regular exercise to support weight loss goals';
    } else {
      messageTitle = 'Obesity';
      message1 = 'Take Action for Better Health';
      message2 = 'Addressing obesity is crucial for overall well-being';
      messageContent1 = 'Consult healthcare professionals for personalized advice';
      messageContent2 = 'Adopt a comprehensive approach with a balanced diet and regular exercise';
    }

    // Navigate to the result screen with BMI and messages
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          bmi: bmi,
          messageTitle: messageTitle,
          message1: message1,
          message2: message2,
          messageContent1: messageContent1,
          messageContent2: messageContent2,
        ),
      ),
    );
  }

  // Helper method to get height in centimeters from HeightContainer
  double _getHeightInCm() {
    return _initialHeightValue; // Assuming you are storing the height value in _initialHeightValue in your HeightContainer
  }

// Helper method to get weight in kilograms from WeightIncrementDecrement
  int _getWeightInKg() {
    return _initialWeightValue; // Assuming you are storing the weight value in _initialWeightValue in your WeightIncrementDecrement
  }



  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(10);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: MyAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 200,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMaleSelected = !_isMaleSelected;
                            _isFemaleSelected = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: borderRadius,
                            color: _isMaleSelected
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.primary,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/male.png',
                                scale: 6,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'MALE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isFemaleSelected = !_isFemaleSelected;
                            _isMaleSelected = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: borderRadius,
                            color: _isFemaleSelected
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.primary,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/female.png',
                                scale: 6,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                'FEMALE',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Height' ,style: TextStyle(fontSize: 15),),
                          Row(
                            children: [
                              buildContainer(context, 'In'),
                              buildContainer(context, 'Ft'),
                              buildContainer(context, 'Cm'),
                            ],
                          ),
                        ],
                      ),
                      HeightContainer(
                        initialValue: _initialHeightValue,
                        onValueChanged: (newValue) {
                          setState(() {
                            _initialHeightValue = newValue;
                          });
                        },
                      )

                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  height: 200,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Weight',style: TextStyle(fontSize: 16),),
                            const SizedBox(height: 20),
                            WeightIncrementDecrement(
                              initialValue: _initialWeightValue,
                              onValueChanged: (newValue) {
                                setState(() {
                                  _initialWeightValue = newValue;
                                });
                              },
                            ),

                            const SizedBox(height: 20),
                            const Text(
                              'kg',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: borderRadius,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Age',style: TextStyle(fontSize: 16)),
                            const SizedBox(height: 20),
                            AgeIncrementDecrement(),
                            const SizedBox(height: 20),
                            const Text(
                              'year',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Center(
                child: GestureDetector(
                  onTap: _calculateBMI,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        borderRadius: borderRadius),
                    child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          child: Text(
                            'Calculate',
                            style:
                            TextStyle(fontSize: 25, color: Colors.grey.shade900),
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(BuildContext context, String text) {
    var borderRadius2 = BorderRadius.circular(50);
    var measurementPadding = const EdgeInsets.all(5);
    return Container(
      width: 30,
      height: 30,
      padding: measurementPadding,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: borderRadius2,
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}
