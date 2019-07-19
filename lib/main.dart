import 'package:flutter/material.dart';

import './Home/home_screen.dart';
import './constants.dart' show AppColors;


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信demo',
      theme: ThemeData.light().copyWith(
        primaryColor: Color(AppColors.AppBarColor),
        cardColor: const Color(AppColors.AppBarColor), // pop menu 背景色
      ),
      home: HomeScreen(),
    );
  }
}

