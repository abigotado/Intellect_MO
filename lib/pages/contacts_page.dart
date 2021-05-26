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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 105),
          color: Color.fromRGBO(81, 140, 255, 1),
          child: Container(
            margin: EdgeInsets.fromLTRB(25, 30, 25, 170),
            padding: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Column(
                  children: [
                    Expanded(
                      flex: 12,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: UserDataFields()),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(
                            left: 1, top: 1, right: 1, bottom: 1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          color: Color.fromRGBO(81, 140, 255, 1),
                        ),
                        child: Container(
                            child: Center(
                                child: Text("Ввод",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.white)))),
                      ),
                    ),
                  ],
                )),
          ),
        ),
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
