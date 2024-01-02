import 'package:flutter/material.dart';

import 'home.dart';
import 'home_page.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState(){
    super.initState();
    navigateToHome();
  }
  void navigateToHome ()async{
    await Future.delayed(const Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:  Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo.png',scale: 3,),
                  Text(
                    'BMI Calculator',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
                  ),
                ],
              ),
            ),
          ),
          CircularProgressIndicator(color: Theme.of(context).colorScheme.tertiary,),
          SizedBox(height: 40,)
        ],
      ),
    );
  }
}
