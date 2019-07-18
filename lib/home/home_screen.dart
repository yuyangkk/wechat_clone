import 'package:flutter/material.dart';

import '../constants.dart' show AppColors;
import '../constants.dart' show Constants;
import './conversation_page.dart';
import './contacts_page.dart';
import './discover_page.dart';


enum AppBarMenuType { MENU_GROUP, MENU_ADD, MENU_SCAN, MENU_PAYMENT, MENU_HELP }

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView(
      {Key key, String title, IconData icon, IconData activeIcon})
      : item = BottomNavigationBarItem(
          icon: Icon(
            icon,
//            color: Color(AppColors.TabBarNormalColor),
          ),
          title: Text(title),
          activeIcon: Icon(
            activeIcon,
//            color: Color(AppColors.TabBarActiveColor), // 此处如果我们的BottomNavigationBar是fixed类型，可以通过修改其fixed属性修改选中颜色
          ),
        );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() {
    return new _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;
  int _currentIndex = 0;
  List<Widget> _pages;
  PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe608,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe656,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe600,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe601,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '发现',
        icon: IconData(
          0xe609,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe603,
          fontFamily: Constants.IconFontFamily,
        ),
      ),
      NavigationIconView(
        title: '我',
        icon: IconData(
          0xe626,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe627,
          fontFamily: Constants.IconFontFamily,
        ),
      )
    ];
    _pages = [
      ConversationPage(),
      ContactsPage(),
      DiscoverPage(),
      Container(color: Colors.brown),
    ];
    _pageController = PageController(initialPage: _currentIndex);
  }

// 创建PopupMenuItem
  _buildPopupMenuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(
          IconData(iconName, fontFamily: Constants.IconFontFamily),
          color: const Color(AppColors.AppBarMenuColor),
          size: 22.0,
        ),
        Container(
          width: 12.0,
        ),
        Text(title,
            style: TextStyle(color: const Color(AppColors.AppBarMenuColor))),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews
          .map<BottomNavigationBarItem>(
              (NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      fixedColor: const Color(AppColors.TabBarActiveColor),
      unselectedFontSize: 12.0,
      selectedFontSize: 12.0,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
//           _pageController.animateToPage(_currentIndex,
//               duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
        });
      },
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0.0, // AppBar 底部阴影
        actions: <Widget>[
          IconButton(
              icon: Icon(
                IconData(
                  0xe615,
                  fontFamily: Constants.IconFontFamily,
                ),
                size: 22.0,
              ),
              onPressed: () {
                print('点击了搜索按钮');
              }),
          Container(
            width: 10.0,
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<AppBarMenuType>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe608, '发起群聊'),
                  value: AppBarMenuType.MENU_GROUP,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe608, '添加朋友'),
                  value: AppBarMenuType.MENU_ADD,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe608, '扫一扫'),
                  value: AppBarMenuType.MENU_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe608, '收付款'),
                  value: AppBarMenuType.MENU_PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe608, '帮助和反馈'),
                  value: AppBarMenuType.MENU_HELP,
                ),
              ];
            },
            icon: Icon(IconData(0xe84f, fontFamily: Constants.IconFontFamily)),
            onSelected: (value) {
              print('点击的是$value');
            },
          ),
          Container(
            width: 10.0,
          ),
        ],
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int page) {
          return _pages[_currentIndex];
        },
        controller: _pageController,
        itemCount: _pages.length,
//        onPageChanged: (int index) {
//          setState(() {
//            _currentIndex = index;
//          });
//        },
        physics: NeverScrollableScrollPhysics(), // 禁止滑动滚动
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
