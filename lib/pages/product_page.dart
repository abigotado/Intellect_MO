import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intellect_mo/widgets/banner/banner.dart';
import 'package:intellect_mo/widgets/price_item/type.dart';
import 'package:intellect_mo/widgets/product_description/product_description_list.dart';

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

class ProductPage extends StatelessWidget {
  final PriceItemType value;

  const ProductPage({Key key, this.value}) : super(key: key);

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
                  if (value.image != null)
                    Container(
                      margin: EdgeInsets.only(
                          left: 25, top: 5, right: 25, bottom: 20),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.network(value.image),
                    ),
                  if (value.description != null)
                    Container(
                        margin: EdgeInsets.only(
                            left: 25, top: 25, right: 25, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (value.descriptionTitle != null)
                              Text(value.descriptionTitle,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            for (var descriptionItem in value.description)
                              ProductDescription(description: descriptionItem),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Center(
                                child: Text("Стоимость занятия: ${value.price} руб./час",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        )),
                  Container(
                      margin: EdgeInsets.only(
                          left: 20, top: 10, right: 25, bottom: 10),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(0, 17, 51, 0.03)),
                      ),
                      child: Center(
                          child: Text(
                              "Записаться".toUpperCase(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)))),
                  Container(
                      margin: EdgeInsets.only(left: 40, top: 10, right: 40, bottom: 20),
                      child: FirstLessonInfo(
                          icon: svgWatches, text: "Первое занятие бесплатно!")),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(right: 56),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: value.name.toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                maxLines: 2,
              ),
            ),
          ),
          backgroundColor: Color(0xFFF8FAFF),
          centerTitle: true,
          leading: GestureDetector(
            child: Container(child: Center(child: svgArrowLeft)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
