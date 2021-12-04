import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppIcons {
  static SvgPicture arrowLeft({
    final Color color,
    final double width,
    final double height,
  }) =>
      SvgPicture.asset(
        'assets/icons/arrowleft.svg',
        width: width ?? 7.r,
        height: height ?? 14.r,
        color: color ?? const Color(0xFF001133).withOpacity(0.6),
      );

  static SvgPicture watches({
    final Color color,
    final double width,
    final double height,
  }) =>
      SvgPicture.asset(
        'assets/icons/timeicon.svg',
        width: width ?? 26.r,
        height: height ?? 26.r,
        color: color,
      );
}
