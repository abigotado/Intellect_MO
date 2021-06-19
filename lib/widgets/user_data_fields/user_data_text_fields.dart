import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intellect_mo/widgets/validators/name_validator.dart';
import 'package:intellect_mo/widgets/validators/phone_validator.dart';

class UserDataFields extends StatefulWidget {
  UserDataFields({Key key}) : super(key: key);

  @override
  _UserDataFieldsState createState() => _UserDataFieldsState();
}

class _UserDataFieldsState extends State<UserDataFields> {
  var name = '';
  var surname = '';
  var phone = '';
  var email = '';

  final _formKey = GlobalKey<FormState>();

  void sendContactInfo({String firstName, String lastName, String phoneNumber, String email}) async {
    print('click');

    final url = Uri.https('webhook.site', 'a365237d-8eb7-483a-9fb2-dd8131f8bbe2');

    Map<String, String> headers = {
      "Authorization": "secret_EvIpZowywyKpoXMuOmWT9vJUpg51M8n1LRkVIyLRunJ",
      "Content-Type": "application/json",
      "Notion-Version": "2021-05-13"
    };

    final body = jsonEncode({
      "parent": {"type": "database_id", "database_id": "633627dfd3c94a27b3e2a1b4cdee5173"},
      "properties": {
        "firstName": {
          "title": [
            {
              "type": "text",
              "text": {"content": "$firstName"}
            }
          ]
        },
        "lastName": {
          "rich_text": [
            {
              "type": "text",
              "text": {"content": "$lastName"}
            }
          ]
        },
        "email": {"type": "email", "email": "$email"},
        "phoneNumber": {
          "rich_text": [
            {
              "type": "text",
              "text": {"content": "$phoneNumber"}
            }
          ]
        }
      }
    });

    await http.post(url, headers: headers, body: body);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.only(bottom: 105),
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
                        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                  child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child:
                                    Text("Введите данные", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
                              )),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text("Имя", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: nameValidator,
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(10),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.transparent)),
                                    filled: true,
                                    fillColor: Color.fromRGBO(248, 250, 255, 1),
                                  ),
                                  style: TextStyle(fontSize: 14, color: Color.fromRGBO(0, 17, 51, 0.6)),
                                  onChanged: (value) {
                                    setState(() {
                                      name = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text("Фамилия", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: nameValidator,
                                  textCapitalization: TextCapitalization.words,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(10),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.transparent)),
                                    filled: true,
                                    fillColor: Color.fromRGBO(248, 250, 255, 1),
                                  ),
                                  style: TextStyle(fontSize: 14, color: Color.fromRGBO(0, 17, 51, 0.6)),
                                  onChanged: (value) {
                                    setState(() {
                                      surname = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text("Телефон", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: phoneValidator,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(10),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.transparent)),
                                    filled: true,
                                    fillColor: Color.fromRGBO(248, 250, 255, 1),
                                  ),
                                  style: TextStyle(fontSize: 14, color: Color.fromRGBO(0, 17, 51, 0.6)),
                                  onChanged: (value) {
                                    setState(() {
                                      phone = value;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text("Email", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
                              ),
                              Container(
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  textCapitalization: TextCapitalization.none,
                                  autovalidateMode: AutovalidateMode.always,
                                  validator: (value) =>
                                      EmailValidator.validate(value) ? null : 'Введите корректный email',
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(10),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.transparent)),
                                    filled: true,
                                    fillColor: Color.fromRGBO(248, 250, 255, 1),
                                  ),
                                  style: TextStyle(fontSize: 14, color: Color.fromRGBO(0, 17, 51, 0.6)),
                                  onChanged: (value) {
                                    setState(() {
                                      email = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(left: 1, top: 1, right: 1, bottom: 1),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                        color: Color.fromRGBO(81, 140, 255, 1),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            sendContactInfo(firstName: name, lastName: surname, phoneNumber: phone, email: email);
                          }
                        },
                        child: Container(
                            child: Center(
                                child: Text("Отправить",
                                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white)))),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
