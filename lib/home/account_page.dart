import 'package:flutter/material.dart';
import '../common/discover_cell.dart';
import '../common/separate_section.dart';
import '../constants.dart' show Constants, AppColors;

class AccountAvatar extends StatefulWidget {
  @override
  _AccountAvatarState createState() => _AccountAvatarState();
}

class _AccountAvatarState extends State<AccountAvatar> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        print('点击了头部');
      },
      padding: const EdgeInsets.all(0.0),
      child: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              height: 60.0,
              width: 60.0,
              margin: EdgeInsets.all(Constants.DiscoverSeparateSize),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/default_nor_avatar.png',
                  image:
                      'http://b-ssl.duitang.com/uploads/item/201412/09/20141209231734_hUyW8.jpeg',
                ),
              ),
            ), // 头像
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '陈大毛陈老板的小秘',
                    style: TextStyle(
                      fontFamily: Constants.IconFontFamily,
                      fontSize: 20.0,
                    ),
                  ),
                  // 昵称
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        '微信号:wxchenlaoban',
                        style: TextStyle(
                          fontFamily: Constants.IconFontFamily,
                          fontSize: 15.0,
                          color: Color(AppColors.DesTitleColor),
                        ),
                      )),
                      Image.asset(
                        'assets/images/ic_qrcode_preview_tiny.png',
                        height: 16.0,
                        width: 16.0,
                      ),
                      Image.asset(
                        'assets/images/ic_arrow.png',
                        width: 16.0,
                        height: 16.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
          AccountAvatar(),
          SeparateSection(),
          DiscoverCell(
              iconPath: 'assets/images/ic_wallet.png',
              title: '支付',
              onPressed: () {
                print('点击了支付');
              }),
          SeparateSection(),
          DiscoverCell(
              iconPath: 'assets/images/ic_collections.png',
              title: '收藏',
              showSplitLine: true,
              onPressed: () {
                print('点击了收藏');
              }),
          DiscoverCell(
              iconPath: 'assets/images/ic_album.png',
              title: '相册',
              showSplitLine: true,
              onPressed: () {
                print('点击了相册');
              }),
          DiscoverCell(
              iconPath: 'assets/images/ic_cards_wallet.png',
              title: '卡包',
              showSplitLine: true,
              onPressed: () {
                print('点击了卡包');
              }),
          DiscoverCell(
              iconPath: 'assets/images/ic_emotions.png',
              title: '表情',
              onPressed: () {
                print('点击了表情');
              }),
          SeparateSection(),
          DiscoverCell(
              iconPath: 'assets/images/ic_settings.png',
              title: '设置',
              onPressed: () {
                print('点击了设置');
              }),
          Divider(
            height: 1.0,
            color: Color(AppColors.DividerColor),
          ),
        ],
      ),
    );
  }
}
