import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/contacts.dart';
import '../constants.dart';

class _ContactItem extends StatelessWidget {
  _ContactItem({
    @required this.avatar,
    @required this.title,
    this.groupTitle,
    this.onpressed,
  });

  final String avatar;
  final String title;
  final String groupTitle;
  final VoidCallback onpressed;

  final double marginVertical = 10.0; //item 上下 margin
  final double itemTitleHeight = 24.0; // section 高度

  // 计算每一行的高度，如果显示分组，则加上分组的高度
  double _height(bool hasGroupTitle) {
    final height = marginVertical * 2 +
        Constants.ContactAvatarSize +
        Constants.DividerWidth;
    if (hasGroupTitle) {
      return height + itemTitleHeight;
    }
    return height;
  }

  @override
  Widget build(BuildContext context) {
    // 左边的图标
    Widget _avatarIcon;
    if (this.avatar.startsWith('http')) {
      _avatarIcon = Image.network(
        avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    } else {
      _avatarIcon = Image.asset(
        avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    }

    // cell 包含有分割线
    Widget _itemBody = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: EdgeInsets.symmetric(vertical: marginVertical),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: Constants.DividerWidth,
            color: Color(AppColors.DividerColor),
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          _avatarIcon,
          SizedBox(width: 10.0),
          Text(title),
        ],
      ),
    );

    // 分组标签
    Widget _itemSection;
    if (this.groupTitle != null) {
      _itemSection = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            height: itemTitleHeight,
            alignment: AlignmentDirectional.centerStart,
            color: Color(AppColors.ContactSectionColor),
            child: Text(
              this.groupTitle,
              style: AppStyles.ContactSectionTitleStyle,
            ),
          ),
          _itemBody,
        ],
      );
    } else {
      _itemSection = _itemBody;
    }

    return Container(
      height: _height(this.groupTitle != null),
      child: _itemSection,
    );
  }
}

const indexBarText = [
  "↑",
  "☆",
  "A",
  "B",
  "C",
  "D",
  "E",
  "F",
  "G",
  "H",
  "I",
  "J",
  "K",
  "L",
  "M",
  "N",
  "O",
  "P",
  "Q",
  "R",
  "S",
  "T",
  "U",
  "V",
  "W",
  "X",
  "Y",
  "Z"
];

class ContactsPage extends StatefulWidget {
  Color indexBarBg = Colors.transparent;

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  ScrollController _scrollController;

  final ContactsPageData data = ContactsPageData.mock();
  final List<Contact> _contacts = [];

  final List<_ContactItem> _functionButtons = [
    _ContactItem(
      avatar: 'assets/images/ic_new_friend.png',
      title: '新的朋友',
      onpressed: () {
        print('点击了新的朋友');
      },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_group_chat.png',
      title: '群聊',
      onpressed: () {
        print('点击了群聊');
      },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_tag.png',
      title: '标签',
      onpressed: () {
        print('点击了标签');
      },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_public_account.png',
      title: '公众号',
      onpressed: () {
        print('点击了公众号');
      },
    ),
  ];

  final List<Widget> _indexBar =
      indexBarText.map((String text) => Expanded(child: Text(text))).toList();

  // Map 用于保存每个分组对应的位置, 默认是第一个，从0.0开始
  // 因为ListView并不是直接把全部的item渲染的，所以，计算方式不能放在ListView.builder方法中，应该是拿到数据之后，先去计算，然后再去更新ListView
  // 在点击indexBar的时候，要计算点击的位置属于第几个text，然后根据text找到Map中对应的索引所对应的的position，进行滚动
  final Map _indexPositonMap = {indexBarText[0]: 0.0};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scrollController = new ScrollController();

    // .. 链式调用
    _contacts
      ..addAll(data.contacts)
      ..addAll(data.contacts)
      ..addAll(data.contacts);
    _contacts
        .sort((Contact a, Contact b) => a.nameIndex.compareTo(b.nameIndex));

    // 计算总的滚动高度，
    double totalHeight = _functionButtons.length * _functionButtons[0]._height(false);
    // 计算 每个分组对应的开始position
    for(int i = 0; i < indexBarText.length; i++) {
      bool hasGroupTitle = true;
      if(i > 0){
        hasGroupTitle = _contacts[i].nameIndex.compareTo(_contacts[i-1].nameIndex) == 0;
      }
      totalHeight += _functionButtons[0]._height(hasGroupTitle);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            if (index < _functionButtons.length) {
              return _functionButtons[index];
            }

            // 标记是否显示section，默认显示
            bool _isShowSection = true;
            int _contactIndex = index - _functionButtons.length;
            if (_contactIndex > 0) {
              _isShowSection = _contacts[_contactIndex].nameIndex !=
                  _contacts[_contactIndex - 1].nameIndex;
            }

            Contact _contact = _contacts[_contactIndex];
            return _ContactItem(
              avatar: _contact.avatar,
              title: _contact.name,
              groupTitle: _isShowSection ? _contact.nameIndex : null,
            );
          },
          itemCount: _contacts.length + _functionButtons.length,
          controller: _scrollController,
        ),
        Positioned(
          top: 0.0,
          bottom: 0.0,
          right: 0.0,
          width: 20.0,
          child: GestureDetector(
            child: Container(
              color: widget.indexBarBg,
              child: Column(
                children: _indexBar,
              ),
            ),
            onVerticalDragDown: (DragDownDetails details) {
              setState(() {
                widget.indexBarBg = Colors.black26;
              });
              _scrollController.animateTo(250.0,
                  duration: Duration(milliseconds: 1), curve: Curves.easeIn);
            },
            onVerticalDragEnd: (DragEndDetails details) {
              setState(() {
                widget.indexBarBg = Colors.transparent;
              });
            },
            onVerticalDragCancel: () {
              setState(() {
                widget.indexBarBg = Colors.transparent;
              });
            },
          ),
        ),
      ],
    );
  }
}
