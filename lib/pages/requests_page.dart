import 'package:flutter/material.dart';
import 'package:intellect_mo/widgets/user_data_fields/user_data_text_fields.dart';

class RequestsPage extends StatefulWidget {
  RequestsPage({Key key}) : super(key: key);

  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(81, 140, 255, 1),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: UserDataFields(),
      ),
      appBar: AppBar(
        title: Text("Записаться на занятие".toUpperCase()),
        elevation: 0,
        backgroundColor: Color.fromRGBO(81, 140, 255, 1),
        centerTitle: true,
      ),
    );
  }
}