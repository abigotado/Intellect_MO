import 'package:flutter/material.dart';
import 'package:intellect_mo/widgets/price_item/type.dart';

class PriceItem extends StatelessWidget {
  final PriceItemType value;

  PriceItem({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8),
            child: Text(value.name,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${value.price} руб./час",
                  style: TextStyle(fontSize: 26, color: Colors.indigo)),
            ],
          ),
        ],
      ),
    );
  }
}
