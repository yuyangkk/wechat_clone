import 'package:flutter/material.dart';

class AppColors {
  static const AppBarColor = 0xff303030;
  static const TabBarNormalColor = 0xff999999;
  static const TabBarActiveColor = 0xff46c11b;
  static const AppBarMenuColor = 0xffffffff;
  static const ConversationTitleColor = 0xff353535;
  static const ConversationItemBg = 0xffffffff;
  static const ConversationDesColor = 0xff9e9e9e;
}

class AppStyles {
  static const TitleStyle = TextStyle(fontSize: 24.0, color: Color(AppColors.ConversationTitleColor));
  static const DesStyle = TextStyle(fontSize: 14.0, color: Color(AppColors.ConversationDesColor));
}

class Constants {
  static const IconFontFamily = "appIconFont";
}