import 'package:flutter/material.dart';

class PriceItemType {
  String name;
  int price;
  String image;
  String description;
  String icon;

  PriceItemType({
    @required this.name,
    @required this.price,
    this.image,
    this.description,
    this.icon,
  });
}
