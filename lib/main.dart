import 'package:flutter/material.dart';

import './Home/home_screen.dart';
import './constants.dart' show AppColors;


void main() => runApp(MaterialApp(
  title: '微信demo',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColors.AppBarColor),
  ),
  home: HomeScreen(),
));

