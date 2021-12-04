import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDescription extends StatelessWidget {
  // ignore: prefer_final_parameters
  const ProductDescription(
      {final Key key, this.description, this.icon, this.markerColor})
      : super(key: key);

  final Widget description;
  final Widget icon;
  final Color markerColor;

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (icon != null) ...<Widget>[
                  SizedBox(
                    width: 20.r,
                    height: 20.r,
                    child: Align(alignment: Alignment.centerLeft, child: icon),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                ] else
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          width: 10.r,
                          height: 10.r,
                          decoration: BoxDecoration(
                            color: markerColor ??
                                const Color.fromRGBO(0, 169, 17, 1),
                            shape: BoxShape.circle,
                          )),
                    ),
                  ),
                SizedBox(
                  width: 5.w,
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
