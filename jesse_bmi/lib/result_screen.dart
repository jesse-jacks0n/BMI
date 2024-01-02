import 'package:flutter/material.dart';
import 'package:jesse_bmi/home_page.dart';

import 'components/app_bar.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key, required this.bmi, required this.messageTitle, required this.message1, required this.message2, required this.messageContent1, required this.messageContent2});
  final double bmi;
  final String messageTitle;
  final String message1;
  final String message2;
  final String messageContent1;
  final String messageContent2;
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double _Value = 25.0;
  @override
  Widget build(BuildContext context) {
    var TextStyle1 = const TextStyle(fontSize: 35);
    var TextStyle2 = TextStyle(fontSize: 25,color: Colors.grey.shade300);
    var TextStyle3 = TextStyle(fontSize: 20,color: Colors.grey.shade400);
    var TextStyle4 = TextStyle(fontSize: 19,color: Colors.grey.shade400);
    var TextStyle5 = TextStyle(fontSize: 17,color: Colors.grey.shade500);
    var borderRadius = BorderRadius.circular(10);
    double indicatorPosition = (widget.bmi - 10.0) / 40.0;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60), child: MyAppBar()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'Result',
                  style: TextStyle1,
                ),
                const SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Your BMI is',style: TextStyle(fontSize: 18),),
                            Text(widget.messageTitle, style: TextStyle(fontSize: 17,color: Theme.of(context).colorScheme.tertiary),)
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          '${widget.bmi.toInt()}',
                          style: const TextStyle(fontSize: 50.0),
                        ),
                        const SizedBox(height: 10.0),
                        // Custom colored BMI indicator
                        Container(
                          width: double.infinity,
                          height: 13,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [
                                Colors.blue,    // Color for BMI < 18.5 (Underweight)
                                Colors.green,   // Color for 18.5 <= BMI < 24.9 (Normal)
                                Colors.yellow,  // Color for 25 <= BMI < 29.9 (Overweight)
                                Colors.red,     // Color for BMI >= 30 (Obese)
                              ],
                              stops: [
                                0.0,
                                0.33,
                                0.66,
                                1.0,
                              ],
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: MediaQuery.of(context).size.width * indicatorPosition,
                                child: Container(
                                  width: 13,
                                  height: 13,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade900,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                 const SizedBox(height: 10,),
                 Text(widget.messageTitle,style: TextStyle2),
                 Text('Diet and Nutrition',style: TextStyle3),
                const SizedBox(height: 10,),
                 Text(widget.message1,style: TextStyle4),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(widget.messageContent1,style: TextStyle5),
                     ],
                   ),
                 ),

                 const SizedBox(height: 10,),
                 Text(widget.message2,style: TextStyle4),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     children: [
                       Text(widget.messageContent2,style: TextStyle5),
                     ],
                   ),
                 ),

              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              child: Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> const HomePage()));
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: borderRadius),
                      child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            child: Text(
                              'Re-Calculate',
                              style:
                              TextStyle(fontSize: 25, color: Colors.grey.shade900),
                            ),
                          )),
                    ),
                  )),
            ),

          ],
        ),
      ),
    );
  }
}
