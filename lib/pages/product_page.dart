import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intellect_mo/models/type.dart';
import 'package:intellect_mo/pages/requests_page.dart';
import 'package:intellect_mo/widgets/banner/banner.dart';
import 'package:intellect_mo/widgets/product_description/product_description_list.dart';

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
              children: [
                if (value.image != null)
                  Container(
                    margin: EdgeInsets.only(
                        left: 25.w, top: 5.h, right: 25.w, bottom: 20.h),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Image.network(value.image),
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
                            ProductDescription(description: descriptionItem),
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
                Container(
                    margin: EdgeInsets.only(
                        left: 20.w, top: 10.h, right: 25.w, bottom: 10.h),
                    padding: EdgeInsets.all(20.r),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                          width: 1.w,
                          color: const Color.fromRGBO(0, 17, 51, 0.03)),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<ProductPage>(
                                builder: (BuildContext context) => RequestsPage(
                                    icon: svgArrowLeft(color: Colors.white))));
                      },
                      child: Center(
                          child: Text('Записаться'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold))),
                    )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<ProductPage>(
                            builder: (BuildContext context) => RequestsPage(
                                icon: svgArrowLeft(color: Colors.white))));
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                          left: 40.w, top: 10.h, right: 40.w, bottom: 20.h),
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
