import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intellect_mo/pages/product_page.dart';
import 'package:intellect_mo/widgets/price_item/type.dart';

class PriceItem extends StatelessWidget {
  final PriceItemType value;

  PriceItem({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute<PriceItemType>(
                builder: (context) => ProductPage(value: value)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 25, top: 15, right: 25, bottom: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            border:
                Border.all(width: 1, color: Color.fromRGBO(0, 17, 51, 0.03))),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(81, 140, 255, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                    child:
                        SvgPicture.asset(value.icon, height: 60, width: 60))),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 14),
                    padding: EdgeInsets.only(left: 10),
                    child: Text(value.name,
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF001133),
                            fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("${value.price} руб./час",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(0, 17, 51, 0.6))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
