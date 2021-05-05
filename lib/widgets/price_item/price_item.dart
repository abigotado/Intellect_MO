import 'package:flutter/material.dart';
import 'package:intellect_mo/widgets/price_item/type.dart';

class PriceItem extends StatelessWidget {
  final PriceItemType value;

  PriceItem({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, top: 15, right: 25, bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(width: 1, color: Color.fromRGBO(0, 17, 51, 0.03))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Container(
              margin: EdgeInsets.only(bottom: 14),
              child: Text(value.name,
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF001133),
                      fontWeight: FontWeight.w500)),
            ),
          ),
          Text("${value.price} руб./час",
              style: TextStyle(fontSize: 12, color: Color.fromRGBO(0, 17, 51, 0.6), fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
