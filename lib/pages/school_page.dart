import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intellect_mo/controllers/school_page_controller.dart';
import 'package:intellect_mo/models/type.dart';
import 'package:intellect_mo/pages/teacher_page.dart';
import 'package:intellect_mo/widgets/product_description/product_description.dart';

final String arrowLeft = 'assets/icons/arrowleft.svg';
final String watches = 'assets/icons/timeicon.svg';
final Widget svgArrowLeft = SvgPicture.asset(
  arrowLeft,
  width: 10,
  height: 20,
);
final Widget svgWatches = SvgPicture.asset(
  watches,
  width: 26,
  height: 26,
);

class SchoolPage extends StatelessWidget {
  final PriceItemType value;

  const SchoolPage({Key key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SchoolPageController>(
        init: SchoolPageController(),
        builder: (SchoolPageController value) {
          return value.school != null &&
                  value.contactsController.contacts != null
              ? Scaffold(
                  body: SafeArea(
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 70.w,
                                  top: 5.h,
                                  right: 70.w,
                                  bottom: 20.h),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: CachedNetworkImage(
                                imageUrl: value.school.classPhoto,
                                placeholder:
                                    (BuildContext context, String url) =>
                                        const Center(
                                            child: CircularProgressIndicator()),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 15.h),
                              child: RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: value.school?.aboutSchool
                                              ?.split('/')
                                              ?.first,
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      TextSpan(
                                          text: value.school?.aboutSchool
                                              ?.split('/')
                                              ?.elementAt(1),
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.black)),
                                    ],
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 15.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: ExpansionTile(
                                key: GlobalKey(),
                                backgroundColor: Colors.transparent,
                                collapsedBackgroundColor: Colors.transparent,
                                childrenPadding: EdgeInsets.only(left: 15.w),
                                title: Text('Что мы развиваем?',
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black)),
                                children: <Widget>[
                                  for (var weDevelopItem
                                      in value.school?.weDevelop)
                                    ProductDescription(
                                        icon: SvgPicture.asset(
                                            'assets/icons/intellectmo-logo.svg'),
                                        description: RichText(
                                            text: TextSpan(
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: weDevelopItem
                                                    .split(' ')
                                                    .first,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                )),
                                            TextSpan(
                                                text:
                                                    ' -${weDevelopItem.split('-').last}',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                )),
                                          ],
                                        ))),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Text(
                                  value.school?.aboutSchool
                                      ?.split('/')
                                      ?.elementAt(2),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.black)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => const TeacherPage());
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      left: 25.w, right: 25.w, bottom: 15.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text('Наш учитель')),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 25.w, top: 15.h, right: 25.w),
                              child: Text(
                                  value.school?.aboutSchool
                                      ?.split('/')
                                      ?.elementAt(3),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.black)),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 25.w, right: 25.w, bottom: 15.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: ExpansionTile(
                                key: GlobalKey(),
                                backgroundColor: Colors.transparent,
                                collapsedBackgroundColor: Colors.transparent,
                                childrenPadding: EdgeInsets.only(left: 15.w),
                                title: Text('Наши преимущества',
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black)),
                                children: <Widget>[
                                  for (var advantage
                                      in value.school?.advantages)
                                    ProductDescription(
                                      icon: SvgPicture.asset(
                                          'assets/icons/intellectmo-logo.svg'),
                                      description: Text(advantage,
                                          style: const TextStyle(
                                            color: Colors.black,
                                          )),
                                    ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 25.w, right: 25.w, bottom: 15.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: ExpansionTile(
                                key: GlobalKey(),
                                backgroundColor: Colors.transparent,
                                collapsedBackgroundColor: Colors.transparent,
                                childrenPadding: EdgeInsets.only(left: 15.w),
                                title: Text('Наша лицензия',
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.black)),
                                children: <Widget>[
                                  SizedBox(
                                    height: 190.h,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_, i) {
                                          return Container(
                                            height: 185.h,
                                            width: 145.w,
                                            child: CachedNetworkImage(
                                              imageUrl:
                                                  value.school?.licenses[i],
                                              placeholder: (BuildContext
                                                          context,
                                                      String url) =>
                                                  const Center(
                                                      child:
                                                          CircularProgressIndicator()),
                                            ),
                                          );
                                        },
                                        separatorBuilder: (_, j) => SizedBox(
                                              width: 10.w,
                                            ),
                                        itemCount:
                                            value.school?.licenses?.length),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 90.h,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  appBar: AppBar(
                    title: Text(
                      "Наш центр".toUpperCase(),
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Color(0xFFF8FAFF),
                    centerTitle: true,
                    elevation: 0,
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        });
  }
}
