import 'package:flutter/material.dart';
import '../model/contacts.dart';


class _ContactItem extends StatelessWidget {

  final Contact _contact = ContactsPageData.mock().contacs[0];

  final String avatar;
  final String title;
  final String groupTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
//          Image.asset(),
        ],
      ),
    );
  }
}


class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}
