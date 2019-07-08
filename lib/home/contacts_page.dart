import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../model/contacts.dart';
import '../constants.dart';

class _ContactItem extends StatelessWidget {
  _ContactItem({
    @required this.avatar,
    @required this.title,
    this.groupTitle,
  });

  final String avatar;
  final String title;
  final String groupTitle;

  @override
  Widget build(BuildContext context) {
    Widget _avatarIcon = Image.network(
      avatar,
      width: Constants.ContactAvatarSize,
      height: Constants.ContactAvatarSize,
    );

    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Container(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
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
      ),
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List<Contact> _contacts = ContactsPageData.mock().contacs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Contact contact = _contacts[index];
        return _ContactItem(avatar: contact.avatar, title: contact.name);
      },
      itemCount: _contacts.length,
    );
  }
}
