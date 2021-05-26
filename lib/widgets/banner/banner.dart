import 'package:flutter/material.dart';

class FirstLessonInfo extends StatelessWidget {
  final String text;
  final Widget icon;

  const FirstLessonInfo({Key key, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromRGBO(81, 140, 255, 1)),
        height: 60,
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Color.fromRGBO(248, 250, 255, 1)),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(child: icon)),
            Text(text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromRGBO(255, 255, 255, 1))),
          ],
        ));
  }
}
