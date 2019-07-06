import 'package:flutter/material.dart';
import 'package:wechat_clone/constants.dart';
import 'package:wechat_clone/model/conversion_model.dart';
import '../constants.dart' show AppColors;
import '../constants.dart' show AppStyles;
import '../constants.dart' show Constants;

class ConversationItem extends StatelessWidget {
  const ConversationItem(this.conversation) : assert(conversation != null);

  final ConversationModel conversation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // 如果使用了修饰器，Container就不可以设置Color属性了，需要放在decoration中设置
        border: Border(
          bottom: BorderSide(
              width: Constants.DividerWidth,
              color: Color(AppColors.DividerColor)),
        ),
        color: Color(AppColors.ConversationItemBg),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/default_nor_avatar.png',
            height: Constants.ConvresationAvatarHeight,
            width: Constants.ConvresationAvatarWidth,
          ),
          Container(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  conversation.title,
                  style: AppStyles.TitleStyle,
                ),
                Text(
                  conversation.des,
                  style: AppStyles.DesStyle,
                ),
              ],
            ),
          ),
          Container(
            width: 10.0,
          ),
          Column(
            children: <Widget>[
              Text(conversation.updateAt, style: AppStyles.DesStyle),
            ],
          ),
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
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return new ConversationItem(mockConversations[index]);
      },
      itemCount: mockConversations.length,
    );
  }
}
