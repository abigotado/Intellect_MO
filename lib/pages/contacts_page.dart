import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intellect_mo/controllers/contacts_conroller.dart';
import 'package:intellect_mo/pages/teacher_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactsController>(
        init: ContactsController(),
        builder: (value) {
          print(value.contacts);
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: Container(
              height: MediaQuery.of(context).size.height,
              color: Color(0xFFF8FAFF),
              child: value.contacts != null
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 120, top: 0, right: 120, bottom: 15),
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(84, 193, 251, 0.05),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(71),
                                      bottomRight: Radius.circular(71))),
                              child: Container(
                                margin: EdgeInsets.only(top: 110),
                                padding: EdgeInsets.all(8),
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: SvgPicture.network(
                                    value.contacts.schoolLogo,
                                    fit: BoxFit.scaleDown),
                              ),
                            ),
                          ),
                          Column(
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
                                          color:
                                              Color.fromRGBO(0, 17, 51, 0.5)))),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20,
                                        top: 20,
                                        right: 10,
                                        bottom: 15),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(70, 199, 253, 0.03),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          CupertinoIcons.at,
                                          color: Color(0xFF46C7FD),
                                          size: 14,
                                        ),
                                        Text('Наш сайт и email',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                        SelectableText.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                              text:
                                                  value?.contacts?.websiteShort,
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  launch(
                                                      value?.contacts?.website);
                                                },
                                            ),
                                          ]),
                                        ),
                                        SelectableText.rich(
                                          TextSpan(children: [
                                            TextSpan(
                                              text: value?.contacts?.emailShort,
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 12,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  launch(value
                                                      ?.contacts?.schoolEmail);
                                                },
                                            ),
                                          ]),
                                        ),
                                      ],
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(
                                        top: 20, right: 20, bottom: 15),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(70, 144, 253, 0.03),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          CupertinoIcons.placemark,
                                          color: Color(0xFF4690FD),
                                          size: 14,
                                        ),
                                        Text('Наш адрес',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                        SelectableText.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: value
                                                    .contacts?.teacherPhone,
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        launch(
                                                            'tel://${value?.contacts?.teacherPhone}');
                                                      },
                                              ),
                                            ],
                                          ),
                                        ),
                                        SelectableText.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: value
                                                    .contacts?.managerPhone,
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        launch(
                                                            'tel://${value?.contacts?.managerPhone}');
                                                      },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 10, bottom: 15),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(240, 18, 131, 0.03),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          CupertinoIcons.phone,
                                          color: Color(0xFFF01283),
                                          size: 14,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: 'Телефон (',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                              TextSpan(
                                                text: 'учитель',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.blue,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Get.to(() =>
                                                            TeacherPage());
                                                      },
                                              ),
                                              TextSpan(
                                                  text: ')',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        SelectableText.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: value
                                                    .contacts?.teacherPhone,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: Colors.black,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        launch(
                                                            'tel://${value?.contacts?.teacherPhone}');
                                                      },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    margin:
                                        EdgeInsets.only(right: 20, bottom: 15),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(245, 152, 38, 0.03),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          CupertinoIcons.phone_circle,
                                          color: Color(0xFFF59826),
                                          size: 14,
                                        ),
                                        Text('Телефон (менеджер)',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                        SelectableText.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text: value
                                                    .contacts?.managerPhone,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        launch(
                                                            'tel://${value?.contacts?.managerPhone}');
                                                      },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: 20, right: 10, bottom: 25),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(100, 220, 52, 0.03),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Наш Instagram',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                        Text('+79636334242')
                                      ],
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    margin:
                                        EdgeInsets.only(right: 20, bottom: 25),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromRGBO(10, 212, 228, 0.03),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Мы в Facebook',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                        Text('+79636334242')
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(),
                        ],
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
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
          );
        });
  }
}
