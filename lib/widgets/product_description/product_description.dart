import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({Key key, this.description, this.icon})
      : super(key: key);

  final Widget description;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (icon != null) ...[
                  SizedBox(
                    width: 20.r,
                    height: 20.r,
                    child: Align(alignment: Alignment.centerLeft, child: icon),
                  ),
                  SizedBox(
                    width: 5.w,
                  )
                ] else
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: icon ??
                          Container(
                              width: 10.r,
                              height: 10.r,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(0, 169, 17, 1),
                                shape: BoxShape.circle,
                              )),
                    ),
                  ),
                Expanded(flex: 14, child: description),
              ],
            ),
          ),
        )
      ],
    );
  }
}
