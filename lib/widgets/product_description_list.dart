import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDescription extends StatelessWidget {
  final String description;

  ProductDescription({Key key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 15, top: 5),
                  alignment: Alignment.center,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 169, 17, 1),
                        borderRadius: BorderRadius.circular(5)),
                  )),
              Expanded(flex: 10, child: Text(description, style: TextStyle(fontSize: 12))),
            ],
          ),
        )
      ],
    );
  }
}
