import 'package:flutter/material.dart';
import 'package:jesse_bmi/common/functions.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  final MyFunctions myFunctions = MyFunctions();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 300,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              scale: 10,
            ),
            const Text(
              ' BMI Calculator',
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: (){
              myFunctions.navigateToSettingsPage(context);
            },
            child: Image.asset(
              'assets/settings.png',
              scale: 17,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ),
      ],
    );
  }
}
