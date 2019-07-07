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
    // 根据图片的获取方式，进行初始化头像组件
    Widget avatar;
    if (conversation.isAvatarFromNet()) {
      avatar = Image.network(
        conversation.avatar,
        height: Constants.ConvresationAvatarHeight,
        width: Constants.ConvresationAvatarWidth,
      );
    } else {
      avatar = Image.asset(
        conversation.avatar,
        height: Constants.ConvresationAvatarHeight,
        width: Constants.ConvresationAvatarWidth,
      );
    }

    // 未读消息
    Widget unreadMsgCountText;
    Widget avatarContainer;
    if (conversation.unreadMsgCount > 0) {
      unreadMsgCountText = Container(
        width: Constants.UnreadMsgDotSize,
        height: Constants.UnreadMsgDotSize,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.UnreadMsgDotSize / 2.0),
          color: Color(AppColors.NotifiDotBgColor),
        ),
        child: Text(conversation.unreadMsgCount.toString(),
            style: AppStyles.NotifiDotStyle),
      );

      // 头像容器，包含未读消息和头像， Stack 类似于addSubView,后添加的在上面
      avatarContainer = Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          Positioned(
            right: -Constants.UnreadMsgDotSize / 2.0 + 6.0,
            top: -Constants.UnreadMsgDotSize / 2.0 + 6.0,
            child: unreadMsgCountText,
          ),
        ],
      );
    } else {
      avatarContainer = avatar;
    }

    // 免打扰
    Widget muteIcon;
    if (conversation.isMute) {
      muteIcon = Icon(
        IconData(
          0xe60f,
          fontFamily: Constants.IconFontFamily,
        ),
        color: Color(AppColors.ConversationMuteIcon),
        size: Constants.ConversationMuteIconSize,
      );
    } else {
      muteIcon = SizedBox(
        height: 10.0,
      ); // SizeBox 占位
    }

    // _rightArea
    List<Widget> _rightArea = <Widget>[
      Text(conversation.updateAt, style: AppStyles.DesStyle),
      Container(
        height: 10.0,
      ),
      muteIcon,
    ];

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
          avatarContainer,
          Container(
            width: 10.0,
          ),
          Expanded(
            // Expanded 是优先显示其他
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  conversation.title,
                  style: AppStyles.TitleStyle,
                ),
                Container(
                  height: 5.0,
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
            children: _rightArea,
          ),
        ],
      ),
    );
  }
}

class _DeviceInfoItem extends StatelessWidget {

  const _DeviceInfoItem({this.device: Device.WIN}) : assert(device != null);

  final Device device;

  int get iconName {
    if (device == Device.WIN) {
      return 0xe73e;
    }
    return 0xe640;
  }

  String get deviceName {
    return this.device == Device.WIN ? 'Windows' : 'Mac';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24.0,top: 10.0,right: 24.0,bottom: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: Constants.DividerWidth, color: Color(AppColors.DividerColor)),
        ),
        color: Color(AppColors.DeviceInfoItemBg),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            IconData(
              this.iconName,
              fontFamily: Constants.IconFontFamily,
            ),
            size: 24.0,
            color: Color(AppColors.DeviceInfoItemIcon),
          ),
          SizedBox(width: 16.0,),
          Text('$deviceName 微信已登录，手机通知已关闭', style: AppStyles.DiveceInfoItemTextStyle),
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

  // const mockConversations<ConversationItem> = ConversationMockData

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return _DeviceInfoItem(device: Device.MAC,);
        }
        return new ConversationItem(mockConversations[index]);
      },
      itemCount: mockConversations.length,
    );
  }
}
