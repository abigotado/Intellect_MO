import 'package:flutter/material.dart';

// ignore_for_file: prefer_final_parameters

class PriceItemType {
  PriceItemType({
    @required this.name,
    @required this.price,
    this.image,
    this.description,
    this.descriptionTitle,
    this.icon,
  });

  final String name;
  final int price;
  final String image;
  final List<dynamic> description;
  final String descriptionTitle;
  final String icon;
}
