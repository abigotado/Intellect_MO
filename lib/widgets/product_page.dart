import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intellect_mo/widgets/price_item/type.dart';

final String watches = 'assets/icons/arrowleft.svg';
final Widget svg = SvgPicture.asset(
  watches,
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
          child: Column(
            children: [
              if (value.image != null)
                Container(
                  child: Image.asset(value.image),
                ),
              if (value.description != null) Text(value.description),
              Text("Стоимость занятия: ${value.price}"),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            value.name,
            style: TextStyle(color: Colors.black, fontFamily: ""),
          ),
          backgroundColor: Color(0xFFF8FAFF),
          centerTitle: true,
          leading: GestureDetector(
            child: Container(height: 50, width: 50, child: Center(child: svg)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
