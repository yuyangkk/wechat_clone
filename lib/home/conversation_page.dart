import 'package:flutter/material.dart';
import '../constants.dart' show AppColors;

class ConversationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.ConversationItemBg),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/default_nor_avatar.png'),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('微信新闻'),
              Text('豪车与出租车刮擦'),
            ],
          )),
          Container(color: Colors.red,),
        ],
      ),
    );
  }
}


class ConversationPage extends StatefulWidget {
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: new ConversationItem(),);
  }
}
