import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jesse_bmi/home_page.dart';
import 'package:jesse_bmi/splash.dart';
import 'package:jesse_bmi/theme/dark_theme.dart';
import 'package:jesse_bmi/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'BMI',
        debugShowCheckedModeBanner: false,
        theme: darkTheme,
        home: HomePage()
    );
  }


  }


