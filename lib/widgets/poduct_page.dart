import 'package:flutter/material.dart';
import 'package:intellect_mo/widgets/price_item/type.dart';

class ProductPage extends StatelessWidget{
  final PriceItemType value;

  const ProductPage({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Страница'),
      ],
    );
  }
}