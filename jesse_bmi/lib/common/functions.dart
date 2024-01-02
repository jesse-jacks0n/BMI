
import 'package:flutter/material.dart';
import 'package:jesse_bmi/settings_page.dart';

class MyFunctions{
  void navigateToSettingsPage(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsPage()));
    return;
  }
}