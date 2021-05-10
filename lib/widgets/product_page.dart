import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intellect_mo/widgets/price_item/type.dart';

final String arrowLeft = 'assets/icons/arrowleft.svg';
final Widget svg = SvgPicture.asset(
  arrowLeft,
  width: 10,
  height: 20,
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
                      margin:
                          EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 20),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(value.image)),
                    ),
                  if (value.description != null)
                    Container(
                        margin: EdgeInsets.only(
                            left: 25, top: 25, right: 25, bottom: 20),
                        child: Text(value.description)),
                  Container(
                      margin:
                          EdgeInsets.only(left: 20, top: 25, right: 25, bottom: 25),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Color.fromRGBO(0, 17, 51, 0.03)),
                        ),
                      child: Center(child: Text("Стоимость занятия: ${value.price} руб./час", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)))),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            value.name.toUpperCase(),
            style: TextStyle(color: Colors.black, fontFamily: "Roboto"),
          ),
          backgroundColor: Color(0xFFF8FAFF),
          centerTitle: true,
          leading: GestureDetector(
            child: Container(height: 50, width: 50, child: Center(child: svg)),
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
