import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {

  ContactsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text("Контакты"),
        ),
      ),
      appBar: AppBar(
        title: Text("Контакты".toUpperCase()),
      ),
    );
  }

}