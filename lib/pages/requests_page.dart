import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intellect_mo/widgets/user_data_fields/user_data_text_fields.dart';

class RequestsPage extends StatefulWidget {
  RequestsPage({Key key, this.icon}) : super(key: key);

  final Widget icon;

  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(81, 140, 255, 1),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: UserDataFields(),
      ),
      appBar: AppBar(
        leading: widget.icon != null
            ? IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: widget.icon,
              )
            : null,
        title: Text('Записаться на занятие'.toUpperCase()),
        elevation: 0,
        backgroundColor: const Color.fromRGBO(81, 140, 255, 1),
        centerTitle: true,
      ),
    );
  }
}
