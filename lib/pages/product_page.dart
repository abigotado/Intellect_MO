import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intellect_mo/models/type.dart';
import 'package:intellect_mo/pages/requests_page.dart';
import 'package:intellect_mo/utils/icons.dart';
import 'package:intellect_mo/widgets/banner/banner.dart';
import 'package:intellect_mo/widgets/product_description/product_description.dart';

final String arrowLeft = 'assets/icons/arrowleft.svg';
final String watches = 'assets/icons/timeicon.svg';

class ProductPage extends StatelessWidget {
  // ignore: prefer_final_parameters
  const ProductPage({final Key key, this.value}) : super(key: key);

  final PriceItemType value;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (value.image != null)
                Container(
                  margin: EdgeInsets.only(
                      left: 25.w, top: 5.h, right: 25.w, bottom: 20.h),
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                  child: Image.network(
                    value.image,
                    loadingBuilder: (final BuildContext context,
                        final Widget child,
                        final ImageChunkEvent loadingProgress) {
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
                      children: <Widget>[
                        if (value.descriptionTitle != null)
                          Text(value.descriptionTitle,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp)),
                        // ignore: always_specify_types
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
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    onPrimary: const Color.fromRGBO(81, 140, 255, 0.8),
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    side: BorderSide(
                        width: 1.w,
                        color: const Color.fromRGBO(81, 140, 255, 0.1)),
                    padding: EdgeInsets.all(20.r),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<RequestsPage>(
                            builder: (final BuildContext context) =>
                                RequestsPage(
                                    icon: AppIcons.arrowLeft(
                                        color: Colors.white))));
                  },
                  child: Center(
                      child: Text(
                    'Записаться'.toUpperCase(),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<ProductPage>(
                          builder: (final BuildContext context) => RequestsPage(
                              icon: AppIcons.arrowLeft(color: Colors.white))));
                },
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 20.w, top: 10.h, right: 20.w, bottom: 20.h),
                    child: FirstLessonInfo(
                        icon: AppIcons.watches(),
                        text: 'Первое занятие бесплатно!')),
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
          icon: AppIcons.arrowLeft(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
    );
  }
}
