import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  void sendContactInfo() async {
    print('click');
    final url = Uri.https('api.notion.com', '/v1/pages');

    Map<String, String> headers = {
      "Authorization": "secret_EvIpZowywyKpoXMuOmWT9vJUpg51M8n1LRkVIyLRunJ",
      "Content-Type": "application/json",
      "Notion-Version": "2021-05-13"
    };

    final body = jsonEncode({
      "parent": { "type": "database_id", "database_id": "633627dfd3c94a27b3e2a1b4cdee5173" },
      "properties": {
        "email": {
          "type": "email",
          "email": "pasyuk.com@gmail.com"
        },
        "phoneNumber": {
          "type": "number",
          "number": 123123
        },
      }
    });

    await http.post(url, headers: headers, body: body);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Text("Введите данные",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24)),
          )),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Text("Имя",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
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
            child: Text("Фамилия",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
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
            child: Text("Телефон",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
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
            child: Text("Email",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          ),
          Container(
            child: TextFormField(
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
          TextButton(onPressed: () {
            sendContactInfo();
          }, child: Text('Send'))
        ],
      ),
    );
  }
}
