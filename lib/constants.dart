import 'package:flutter/material.dart';

class AppColors {
  static const AppBarColor = 0xff303030;
  static const TabBarNormalColor = 0xff999999;
  static const TabBarActiveColor = 0xff46c11b;
  static const AppBarMenuColor = 0xffffffff;
  static const TitleColor = 0xff353535;
  static const ConversationItemBg = 0xffffffff;
  static const DesTitleColor = 0xff9e9e9e;
  static const DividerColor = 0xffd9d9d9;
  static const NotifiDotBgColor = 0xffff3e3e;
  static const NotifiDotTextColor = 0xffffffff;
  static const ConversationMuteIcon = 0xffd8d8d8;
  static const DeviceInfoItemBg = 0xfff5f5f5;
  static const DeviceInfoItemText = 0xff606062;
  static const DeviceInfoItemIcon = 0xff606062;
  static const ContactSectionColor = 0xffe7e7e7;
  static const ContactSectionTitleColor = 0xff7b7b7b;
}

class AppStyles {
  static const TitleStyle =
      TextStyle(fontSize: 14.0, color: Color(AppColors.TitleColor));
  static const DesStyle =
      TextStyle(fontSize: 12.0, color: Color(AppColors.DesTitleColor));
  static const NotifiDotStyle = TextStyle(
      fontSize: 12.0,
      color: Color(AppColors.NotifiDotTextColor),
      backgroundColor: Color(AppColors.NotifiDotBgColor));
  static const DiveceInfoItemTextStyle = TextStyle(
    fontSize: 13.0,
    color: Color(AppColors.DeviceInfoItemText),
  );

  static const ContactSectionTitleStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.ContactSectionTitleColor),
  );

}

class Constants {
  static const IconFontFamily = "appIconFont";
  static const ConversationAvatarWidth = 48.0;
  static const ConversationAvatarHeight = 48.0;
  static const DividerWidth = 1.0;
  static const UnreadMsgDotSize = 20.0;
  static const ConversationMuteIconSize = 14.0;
  static const ContactAvatarSize = 36.0;
  static const DiscoverCellIconSize = 24.0;
  static const DiscoverSeparateSize = 16.0;
}
