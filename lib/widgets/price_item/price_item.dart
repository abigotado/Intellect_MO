import 'package:flutter/material.dart';
import 'package:intellect_mo/widgets/price_item/type.dart';

class PriceItem extends StatelessWidget {
  final PriceItemType value;

  PriceItem({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text("$value.name"),
      Text(" - $value.price"),
      Text(" руб./час"),
    ],
    );
  }
}