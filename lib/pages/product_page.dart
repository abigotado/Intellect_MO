import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intellect_mo/models/type.dart';
import 'package:intellect_mo/pages/requests_page.dart';
import 'package:intellect_mo/widgets/banner/banner.dart';
import 'package:intellect_mo/widgets/product_description/product_description.dart';

final String arrowLeft = 'assets/icons/arrowleft.svg';
final String watches = 'assets/icons/timeicon.svg';

Widget svgArrowLeft({Color color}) {
  return SvgPicture.asset(
    arrowLeft,
    width: 10,
    height: 20,
    color: color,
  );
}

final Widget svgWatches = SvgPicture.asset(
  watches,
  width: 26,
  height: 26,
);

class ProductPage extends StatelessWidget {
  const ProductPage({Key key, this.value}) : super(key: key);

  final PriceItemType value;

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                if (value.image != null)
                  Container(
                    margin: EdgeInsets.only(
                        left: 25.w, top: 5.h, right: 25.w, bottom: 20.h),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Image.network(
                      value.image,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                if (value.description != null)
                  Container(
                      margin: EdgeInsets.only(
                          left: 25.w, top: 25.h, right: 25.w, bottom: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (value.descriptionTitle != null)
                            Text(value.descriptionTitle,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp)),
                          for (var descriptionItem in value.description)
                            ProductDescription(
                                description: Text(descriptionItem,
                                    style: TextStyle(fontSize: 12.sp))),
                          Container(
                            margin: EdgeInsets.only(top: 20.h),
                            child: Center(
                              child: Text(
                                  'Стоимость занятия: ${value.price} руб./час',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      )),
                Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: OutlinedButton(
                      style: ButtonStyle(
                        textStyle: MaterialStateProperty.all(TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        )),
                        foregroundColor: MaterialStateProperty.all(
                            const Color.fromRGBO(81, 140, 255, 0.8)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        )),
                        side: MaterialStateProperty.all<BorderSide>(BorderSide(
                            width: 1.w,
                            color: const Color.fromRGBO(81, 140, 255, 0.1))),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(20.r)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<ProductPage>(
                                builder: (BuildContext context) => RequestsPage(
                                    icon: svgArrowLeft(color: Colors.white))));
                      },
                      child: Center(
                          child: Text(
                        'Записаться'.toUpperCase(),
                      )),
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<ProductPage>(
                            builder: (BuildContext context) => RequestsPage(
                                icon: svgArrowLeft(color: Colors.white))));
                  },
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, top: 10.h, right: 20.w, bottom: 20.h),
                      child: FirstLessonInfo(
                          icon: svgWatches, text: 'Первое занятие бесплатно!')),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Container(
            padding: EdgeInsets.only(right: 56.w),
            child: Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: value.name.toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                maxLines: 2,
              ),
            ),
          ),
          backgroundColor: const Color(0xFFF8FAFF),
          centerTitle: true,
          leading: IconButton(
            icon: svgArrowLeft(),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
