import 'package:flutter/material.dart';
import 'package:intellect_mo/widgets/banner/banner.dart';
import 'package:intellect_mo/widgets/price_item/price_item.dart';
import 'package:intellect_mo/widgets/price_item/type.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final String mentalArithmeticIcon = 'assets/icons/pendilum.svg';
final String brainIntellect = 'assets/icons/square-academic-cap.svg';
final String learnReading = 'assets/icons/textbook.svg';
final String fastReading = 'assets/icons/books.svg';
final String schoolPreparation = 'assets/icons/backpack.svg';
final String homework = 'assets/icons/evaluation.svg';

class ProductsPage extends StatefulWidget {
  ProductsPage({Key key}) : super(key: key);

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<PriceItemType> products = [];

  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    final productsRef = db.collection('products');
    productsRef.get().then((serverProducts) {
      List<PriceItemType> preparedProducts = [];
      for (var product in serverProducts.docs) {
        PriceItemType prepareProduct = PriceItemType(
            name: product.get('name'),
            price: product.get('price'),
            descriptionTitle: product.get('descriptionTitle'),
            description: product.get('description'),
            image: product.get('image'),
            icon: product.get('icon'));
        preparedProducts.add(prepareProduct);
      }
      setState(() {
        products = preparedProducts;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            color: Color(0xFFF8FAFF),
            padding: EdgeInsets.only(bottom: 115),
            child: StreamBuilder<QuerySnapshot>(
                        stream: db.collection('products').snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else
                            return ListView.builder(
                                itemCount: products.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return PriceItem(value: products[index]);
                                });
                        }),
            ),
          ),
        appBar: AppBar(
          title: Text(
            "Наши занятия".toUpperCase(),
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0xFFF8FAFF),
          centerTitle: true,
          elevation: 0,
        ));
  }
}
