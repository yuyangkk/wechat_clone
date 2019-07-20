import 'package:flutter/material.dart';
import '../constants.dart' show AppColors, Constants;

class SeparateSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(height: 1.0, color: Color(AppColors.DividerColor),),
        SizedBox(height: Constants.DiscoverSeparateSize),
        Divider(height: 1.0, color: Color(AppColors.DividerColor),),
      ],
    );
  }
}
