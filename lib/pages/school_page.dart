import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intellect_mo/widgets/price_item/type.dart';

final String arrowLeft = 'assets/icons/arrowleft.svg';
final String watches = 'assets/icons/timeicon.svg';
final Widget svgArrowLeft = SvgPicture.asset(
  arrowLeft,
  width: 10,
  height: 20,
);
final Widget svgWatches = SvgPicture.asset(
  watches,
  width: 26,
  height: 26,
);

class SchoolPage extends StatelessWidget {
  final PriceItemType value;

  const SchoolPage({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: 25, top: 5, right: 25, bottom: 20),
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Text('О нашем центре'),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          left: 25, top: 25, right: 25, bottom: 20),
                      child: Text('Наш учитель')),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Наш центр".toUpperCase(),
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xFFF8FAFF),
          centerTitle: true,
          elevation: 0,
        ),
      ),
    );
  }
}
