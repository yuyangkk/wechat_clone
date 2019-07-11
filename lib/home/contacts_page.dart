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
  final itemHeight = 48.0;

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

    Widget _itemBody = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
            padding:
                EdgeInsets.only(left: 16.0, top: 4.0, right: 16.0, bottom: 4.0),
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
            onVerticalDragDown: (DragDownDetails details){
              setState(() {
                widget.indexBarBg = Colors.black26;
              });
              _scrollController.animateTo(250.0, duration: Duration(milliseconds: 1), curve: Curves.easeIn);
            },

            onVerticalDragEnd: (DragEndDetails details){
              setState(() {
                widget.indexBarBg = Colors.transparent;
              });
            },

            onVerticalDragCancel: (){
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
