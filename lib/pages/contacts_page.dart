import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          color: Color(0xFFF8FAFF),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 120, top: 0, right: 120, bottom: 20),
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(84, 193, 251, 0.05),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(71),
                            bottomRight: Radius.circular(71))),
                    child: Container(
                      margin: EdgeInsets.only(top: 100),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45)),
                      clipBehavior: Clip.hardEdge,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 120, top: 17, right: 120),
                    child: Column(
                      children: [
                        Center(
                            child: Text('Интеллект МО',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))),
                        Center(
                            child: Text('Южный лёд',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(0, 17, 51, 0.5)))),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(
                            left: 20, top: 25, right: 10, bottom: 15),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(70, 199, 253, 0.03),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [Text('Телефон'), Text('+79636334242')],
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 25, right: 20, bottom: 15),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(70, 144, 253, 0.03),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [Text('Телефон'), Text('+79636334242')],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Контакты".toUpperCase(),
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0.0,
        ),
      ),
    );
  }
}
