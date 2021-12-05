import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intellect_mo/controllers/school_page_controller.dart';
import 'package:intellect_mo/models/type.dart';
import 'package:intellect_mo/pages/photo_page.dart';
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
  // ignore: prefer_final_parameters
  const SchoolPage({final Key key, this.value}) : super(key: key);

  final PriceItemType value;

  @override
  Widget build(final BuildContext context) {
    return GetBuilder<SchoolPageController>(
        init: SchoolPageController(),
        builder: (final SchoolPageController value) {
          return value.school != null &&
                  value.teacherPageController.teacher != null
              ? Scaffold(
                  body: SafeArea(
                    child: Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            AppBar(
                              title: Text(
                                'Наш центр'.toUpperCase(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              backgroundColor: const Color(0xFFF8FAFF),
                              centerTitle: true,
                              elevation: 0,
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
                                placeholder: (final BuildContext context,
                                        final String url) =>
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
                              margin: EdgeInsets.symmetric(horizontal: 25.w),
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
                                  // ignore: always_specify_types
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
                              padding: EdgeInsets.symmetric(
                                horizontal: 25.w,
                                vertical: 10.h,
                              ),
                              child: Text(
                                  value.school?.aboutSchool
                                      ?.split('/')
                                      ?.elementAt(2),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 14.sp, color: Colors.black)),
                            ),
                            Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 25.w,
                                  vertical: 15.h,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Stack(
                                  children: <Widget>[
                                    CachedNetworkImage(
                                      imageUrl: value.teacherPageController
                                          .teacher.photoSmall,
                                      height: 173.h,
                                      placeholder: (final BuildContext context,
                                              final String url) =>
                                          const Center(
                                              child:
                                                  CircularProgressIndicator()),
                                    ),
                                    Positioned(
                                      top: 25.h,
                                      left: 135.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Наш учитель'.toUpperCase(),
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                color: const Color(0xFFFB9A54),
                                              )),
                                          SizedBox(height: 8.h),
                                          Text(
                                            value.teacherPageController.teacher
                                                    .name +
                                                ' ' +
                                                value.teacherPageController
                                                    .teacher.surname,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxWidth: 200.w,
                                            ),
                                            child: Text(
                                              value.teacherPageController
                                                  .teacher.title,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: const Color(0xFF001133)
                                                    .withOpacity(0.5),
                                              ),
                                              maxLines: 3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 20.r,
                                      bottom: 20.r,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute<TeacherPage>(
                                              builder: (final BuildContext
                                                      context) =>
                                                  const TeacherPage(),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          primary: const Color(0xFF518CFF),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        child: Text('Подробнее',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white,
                                            )),
                                      ),
                                    ),
                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 25.w,
                                top: 10.h,
                                right: 25.w,
                                bottom: 15.h,
                              ),
                              child: Text(
                                  value.school?.aboutSchool
                                      ?.split('/')
                                      ?.elementAt(3),
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  )),
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
                                  // ignore: always_specify_types
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
                                        // ignore: always_specify_types, prefer_final_parameters
                                        itemBuilder: (_, i) {
                                          return Container(
                                            height: 185.h,
                                            width: 145.w,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  // ignore: always_specify_types
                                                  PageRouteBuilder(
                                                    opaque: false,
                                                    barrierColor: Colors.black
                                                        .withOpacity(0.5),
                                                    pageBuilder:
                                                        (final BuildContext
                                                                context,
                                                            final _,
                                                            final __) {
                                                      return PhotoPage(value
                                                          .school?.licenses[i]);
                                                    },
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                margin: EdgeInsets.all(10.r),
                                                padding: EdgeInsets.only(
                                                  left: 10.r,
                                                  top: 10.r,
                                                  right: 10.r,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFE7F7FF),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    boxShadow: <BoxShadow>[
                                                      BoxShadow(
                                                        color: const Color(
                                                                0xFF2A2435)
                                                            .withOpacity(0.15),
                                                        blurRadius: 0.5,
                                                        offset:
                                                            const Offset(1, -1),
                                                      ),
                                                    ],
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl: value
                                                        .school?.licenses[i],
                                                    placeholder: (final BuildContext
                                                                context,
                                                            final String url) =>
                                                        const Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                        // ignore: always_specify_types, prefer_final_parameters
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
                )
              : const Center(child: CircularProgressIndicator());
        });
  }
}
