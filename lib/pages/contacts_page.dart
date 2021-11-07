import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intellect_mo/controllers/contacts_conroller.dart';
import 'package:intellect_mo/pages/teacher_page.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactsController>(
        init: ContactsController(),
        builder: (final ContactsController value) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            body: Container(
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFFF8FAFF),
              child: value.contacts != null
                  ? SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 120.w,
                                  top: 0,
                                  right: 120.w,
                                  bottom: 15.h),
                              padding: EdgeInsets.only(
                                  left: 20.w, right: 20.w, bottom: 20.h),
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(84, 193, 251, 0.05),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(71.r),
                                      bottomRight: Radius.circular(71.r))),
                              child: Container(
                                margin: EdgeInsets.only(top: 110.h),
                                padding: EdgeInsets.all(8.r),
                                height: 90,
                                width: 90,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: SvgPicture.network(
                                    value.contacts.schoolLogo,
                                    fit: BoxFit.scaleDown),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Center(
                                  child: Text('Интеллект МО',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500))),
                              Center(
                                  child: Text('Южный лёд',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          color: const Color.fromRGBO(
                                              0, 17, 51, 0.5)))),
                            ],
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      constraints:
                                          const BoxConstraints.expand(),
                                      margin: EdgeInsets.only(
                                          left: 20.w,
                                          top: 20.h,
                                          right: 10.w,
                                          bottom: 15.h),
                                      padding: EdgeInsets.all(15.r),
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              70, 199, 253, 0.03),
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            CupertinoIcons.at,
                                            color: const Color(0xFF46C7FD),
                                            size: 14.r,
                                          ),
                                          Text('Наш сайт и email',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500)),
                                          SelectableText.rich(
                                            TextSpan(children: [
                                              TextSpan(
                                                text: value
                                                    ?.contacts?.websiteShort,
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 12.sp,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        launch(value?.contacts
                                                            ?.website);
                                                      },
                                              ),
                                            ]),
                                          ),
                                          SelectableText.rich(
                                            TextSpan(children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    value?.contacts?.emailShort,
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 12.sp,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        launch(value?.contacts
                                                            ?.schoolEmail);
                                                      },
                                              ),
                                            ]),
                                          ),
                                        ],
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                      constraints:
                                          const BoxConstraints.expand(),
                                      margin: EdgeInsets.only(
                                          top: 20.h, right: 20.w, bottom: 15.w),
                                      padding: EdgeInsets.all(15.r),
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              70, 144, 253, 0.03),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(
                                            CupertinoIcons.placemark,
                                            color: const Color(0xFF4690FD),
                                            size: 14.r,
                                          ),
                                          Text('Наш адрес',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500)),
                                          SelectableText.rich(
                                            TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: value.contacts?.address,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.sp,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          if (value
                                                                  .availableMaps !=
                                                              null)
                                                            Get.bottomSheet(
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: <
                                                                    Widget>[
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: 20
                                                                            .h),
                                                                    child: Text(
                                                                        'Показать местоположение с помощью:',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              20.sp,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          color:
                                                                              Colors.black,
                                                                        )),
                                                                  ),
                                                                  for (AvailableMap map
                                                                      in value
                                                                          .availableMaps)
                                                                    ListTile(
                                                                      onTap: () =>
                                                                          map.showMarker(
                                                                        coords: Coords(
                                                                            value?.contacts?.addressLat,
                                                                            value?.contacts?.addressLong),
                                                                      ),
                                                                      title: Text(
                                                                          map.mapName),
                                                                      leading:
                                                                          SvgPicture
                                                                              .asset(
                                                                        map.icon,
                                                                        height:
                                                                            30.0,
                                                                        width:
                                                                            30.0,
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          16.r),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          16.r),
                                                                ),
                                                              ),
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xFFF8FAFF),
                                                            );
                                                        },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      constraints:
                                          const BoxConstraints.expand(),
                                      margin: EdgeInsets.only(
                                          left: 20.w,
                                          right: 10.w,
                                          bottom: 15.h),
                                      padding: EdgeInsets.all(15.r),
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              240, 18, 131, 0.03),
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.smartphone_outlined,
                                            color: const Color(0xFFF01283),
                                            size: 14.sp,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: 'Телефон (',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    )),
                                                TextSpan(
                                                  text: 'учитель',
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.blue,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          Get.to(() =>
                                                              const TeacherPage());
                                                        },
                                                ),
                                                TextSpan(
                                                    text: ')',
                                                    style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SelectableText.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: value
                                                      .contacts?.teacherPhone,
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Colors.black,
                                                  ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          launch(
                                                              'tel://${value?.contacts?.teacherPhone}');
                                                        },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                      constraints:
                                          const BoxConstraints.expand(),
                                      margin: EdgeInsets.only(
                                          right: 20.w, bottom: 15.h),
                                      padding: EdgeInsets.all(15.r),
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              245, 152, 38, 0.03),
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            CupertinoIcons.phone,
                                            color: Color(0xFFF59826),
                                            size: 14.sp,
                                          ),
                                          Text('Телефон (менеджер)',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500)),
                                          SelectableText.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: value
                                                      .contacts?.managerPhone,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.sp,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          launch(
                                                              'tel://${value?.contacts?.managerPhone}');
                                                        },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      constraints:
                                          const BoxConstraints.expand(),
                                      margin: EdgeInsets.only(
                                          left: 20.w,
                                          right: 10.w,
                                          bottom: 25.h),
                                      padding: EdgeInsets.all(15.r),
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              100, 220, 52, 0.03),
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(Icons.photo_camera_outlined,
                                              color: const Color(0xFF64DC34),
                                              size: 14.r),
                                          Text('Наш Instagram',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500)),
                                          SelectableText.rich(
                                            TextSpan(children: [
                                              TextSpan(
                                                text: value
                                                    ?.contacts?.instagramShort,
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 12.sp,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        launch(value?.contacts
                                                            ?.instagram);
                                                      },
                                              ),
                                            ]),
                                          ),
                                        ],
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                      constraints:
                                          const BoxConstraints.expand(),
                                      margin: EdgeInsets.only(
                                          right: 20.w, bottom: 25.h),
                                      padding: EdgeInsets.all(15.r),
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              10, 212, 228, 0.03),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Icon(Icons.facebook_outlined,
                                              color: const Color(0xFF0AD4E4),
                                              size: 14.r),
                                          Text('Мы в Facebook',
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500)),
                                          SelectableText.rich(
                                            TextSpan(children: [
                                              TextSpan(
                                                text: value
                                                    ?.contacts?.facebookShort,
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 12.sp,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () async {
                                                        try {
                                                          bool isLaunched =
                                                              await launch(
                                                                  value
                                                                      ?.contacts
                                                                      ?.facebook,
                                                                  forceSafariVC:
                                                                      false,
                                                                  forceWebView:
                                                                      false);
                                                          if (!isLaunched) {
                                                            await launch(
                                                                value?.contacts
                                                                    ?.facebookUnlaunched,
                                                                forceSafariVC:
                                                                    false,
                                                                forceWebView:
                                                                    false);
                                                          }
                                                        } catch (e) {
                                                          await launch(
                                                              value?.contacts
                                                                  ?.facebookUnlaunched,
                                                              forceSafariVC:
                                                                  false,
                                                              forceWebView:
                                                                  false);
                                                        }
                                                      },
                                              ),
                                            ]),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(),
                        ],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
            appBar: AppBar(
              title: Text(
                'Контакты'.toUpperCase(),
                style: const TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0.0,
            ),
          );
        });
  }
}
