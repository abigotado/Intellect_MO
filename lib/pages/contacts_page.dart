import 'package:flutter/material.dart';
import 'package:intellect_mo/widgets/user_data_fields/user_data_text_fields.dart';

class ContactsPage extends StatefulWidget {
  ContactsPage({Key key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(81, 140, 255, 1),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: UserDataFields(),
      ),
      appBar: AppBar(
        title: Text("Контакты".toUpperCase()),
        elevation: 0,
        backgroundColor: Color.fromRGBO(81, 140, 255, 1),
        centerTitle: true,
      ),
    );
  }
}
