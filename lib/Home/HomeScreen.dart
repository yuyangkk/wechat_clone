import 'package:flutter/material.dart';

class NavigationIconView {
  final String _title;
  final Widget _icon;
  final Widget _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, Widget icon, Widget activeIcon})
      : _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        item = BottomNavigationBarItem(
          icon: icon,
          title: Text(title),
          activeIcon: activeIcon,
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigationViews = <NavigationIconView>[
      NavigationIconView(
        title: '微信',
        icon: Icon(Icons.home),
        activeIcon: Icon(Icons.tab_unselected),
      ),
      NavigationIconView(
        title: '通讯录',
        icon: Icon(Icons.tab),
        activeIcon: Icon(Icons.table_chart),
      ),
      NavigationIconView(
        title: '发现',
        icon: Icon(Icons.ac_unit),
        activeIcon: Icon(Icons.access_alarm),
      ),
      NavigationIconView(
        title: '我',
        icon: Icon(Icons.ac_unit),
        activeIcon: Icon(Icons.access_alarm),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews
          .map<BottomNavigationBarItem>((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
      },
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Text('内容'),
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
