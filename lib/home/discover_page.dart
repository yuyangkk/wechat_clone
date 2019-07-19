import 'package:flutter/material.dart';
import '../common/discover_cell.dart';
import '../constants.dart' show Constants, AppColors;


class AccountAvatar extends StatefulWidget {
  @override
  _AccountAvatarState createState() => _AccountAvatarState();
}

class _AccountAvatarState extends State<AccountAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      color: Colors.red,
    );
  }
}



class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          AccountAvatar(),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),

          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          DiscoverCell(
            iconPath: 'assets/images/ic_social_circle.png',
            title: '朋友圈',
            onPressed: () {
              print('点击了朋友圈');
            },
          ),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          SizedBox(height: Constants.DiscoverSeparateSize),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          DiscoverCell(
            iconPath: 'assets/images/ic_quick_scan.png',
            title: '扫一扫',
            showSplitLine: true,
            onPressed: () {
              print('点击了扫一扫');
            },
          ),
          DiscoverCell(
            iconPath: 'assets/images/ic_shake_phone.png',
            title: '摇一摇',
            onPressed: () {
              print('点击了摇一摇');
            },
          ),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          SizedBox(height: Constants.DiscoverSeparateSize),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          DiscoverCell(
            iconPath: 'assets/images/ic_feeds.png',
            title: '看一看',
            showSplitLine: true,
            onPressed: () {
              print('点击了看一看');
            },
          ),
          DiscoverCell(
            iconPath: 'assets/images/ic_quick_search.png',
            title: '搜一搜',
            onPressed: () {
              print('点击了搜一搜');
            },
          ),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          SizedBox(height: Constants.DiscoverSeparateSize),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          DiscoverCell(
            iconPath: 'assets/images/ic_shopping.png',
            title: '购物',
            showSplitLine: true,
            onPressed: () {
              print('点击了购物');
            },
          ),
          DiscoverCell(
            iconPath: 'assets/images/ic_game_entry.png',
            title: '游戏',
            onPressed: () {
              print('点击了游戏');
            },
            content: '权利的游戏全新首发',
          ),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          SizedBox(height: Constants.DiscoverSeparateSize),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          DiscoverCell(
            iconPath: 'assets/images/ic_mini_program.png',
            title: '小程序',
            onPressed: () {
              print('点击了小程序');
            },
          ),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
        ],
      ),
    );
  }
}
