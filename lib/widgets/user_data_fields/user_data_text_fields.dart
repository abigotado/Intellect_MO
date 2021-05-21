import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Container(
            margin: EdgeInsets.only(bottom: 15),
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
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent)),
                filled: true,
                fillColor: Color.fromRGBO(248, 250, 255, 1),
              ),
              style: TextStyle(fontSize: 12, color: Color.fromRGBO(0, 17, 51, 0.6)),
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
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent)),
                filled: true,
                fillColor: Color.fromRGBO(248, 250, 255, 1),
              ),
              style: TextStyle(fontSize: 12, color: Color.fromRGBO(0, 17, 51, 0.6)),
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
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent)),
                filled: true,
                fillColor: Color.fromRGBO(248, 250, 255, 1),
              ),
              style: TextStyle(fontSize: 12, color: Color.fromRGBO(0, 17, 51, 0.6)),
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
            margin: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent)),
                filled: true,
                fillColor: Color.fromRGBO(248, 250, 255, 1),
              ),
              style: TextStyle(fontSize: 12, color: Color.fromRGBO(0, 17, 51, 0.6)),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
