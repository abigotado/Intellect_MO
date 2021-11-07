import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstLessonInfo extends StatelessWidget {
  const FirstLessonInfo({Key key, this.text, this.icon}) : super(key: key);

  final String text;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color.fromRGBO(81, 140, 255, 1)),
        height: 60,
        child: Row(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 15.w),
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(child: icon)),
            Text(text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white)),
          ],
        ));
  }
}
