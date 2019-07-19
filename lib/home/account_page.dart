import 'package:flutter/material.dart';
import '../common/discover_cell.dart';
import '../constants.dart' show Constants, AppColors;

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[

          SizedBox(height: Constants.DiscoverSeparateSize),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          DiscoverCell(iconPath: 'assets/images/ic_wallet.png', title: '支付', onPressed: (){ print('点击了支付'); }),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          SizedBox(height: Constants.DiscoverSeparateSize),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          DiscoverCell(iconPath: 'assets/images/ic_collections.png', title: '收藏', showSplitLine: true, onPressed: (){ print('点击了收藏'); }),
          DiscoverCell(iconPath: 'assets/images/ic_album.png', title: '相册', showSplitLine: true,  onPressed: (){ print('点击了相册'); }),
          DiscoverCell(iconPath: 'assets/images/ic_cards_wallet.png', title: '卡包', showSplitLine: true,  onPressed: (){ print('点击了卡包'); }),
          DiscoverCell(iconPath: 'assets/images/ic_emotions.png', title: '表情',  onPressed: (){ print('点击了表情'); }),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          SizedBox(height: Constants.DiscoverSeparateSize),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
          DiscoverCell(iconPath: 'assets/images/ic_settings.png', title: '设置', onPressed: (){ print('点击了设置'); }),
          Divider(height: 1.0, color: Color(AppColors.DividerColor),),
        ],
      ),
    );
  }
}
