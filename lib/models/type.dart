import 'package:flutter/material.dart';

class PriceItemType {
  String name;
  int price;
  String image;
  List<dynamic> description;
  String descriptionTitle;
  String icon;

  PriceItemType({
    @required this.name,
    @required this.price,
    this.image,
    this.description,
    this.descriptionTitle,
    this.icon,
  });
}
