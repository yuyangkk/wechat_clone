import 'package:flutter/material.dart';
import '../constants.dart';

class DiscoverCell extends StatelessWidget {
  static const SizeBoxWidth = 16.0;
  static const VerticalPadding = 13.0;

  const DiscoverCell({
    @required this.iconPath,
    @required this.title,
    @required this.onPressed,
    this.content,
    this.showSplitLine = false,
  })  : assert(iconPath != null),
        assert(title != null),
        assert(onPressed != null);

  final String iconPath;
  final String title;
  final VoidCallback onPressed;
  final String content;
  final bool showSplitLine;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: this.onPressed,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            vertical: VerticalPadding, horizontal: SizeBoxWidth),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              this.iconPath,
              width: Constants.DiscoverCellIconSize,
              height: Constants.DiscoverCellIconSize,
            ),
            SizedBox(width: SizeBoxWidth),
            Text(this.title),
            Expanded(
              child: Text(
                this.content ?? '',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.right,
              ),
            ),
            Image.asset(
              'assets/images/ic_arrow.png',
              width: 16.0,
              height: 16.0,
            ),
          ],
        ));
  }
}
