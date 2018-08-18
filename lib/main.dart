import 'package:bmi_app/ui/bmi_main_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    new MyApp()
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'BMI',
      theme: new ThemeData(
        primaryColor: Colors.blue,
        primaryColorDark: Colors.pink,
      ),
      home: new HomePage(),
    );
  }
}

