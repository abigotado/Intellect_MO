import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({final Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ignore: always_specify_types, prefer_final_parameters
    Future.delayed(const Duration(seconds: 2)).then((value) async {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute<MainScreen>(
          builder: (final BuildContext context) => MainScreen(),
        ),
        (final Route<dynamic> route) => false,
      );
      Get.off(() => MainScreen());
    });
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(50),
      child: Center(
          child: SvgPicture.asset(
        'assets/icons/intellectmo-logo.svg',
        fit: BoxFit.scaleDown,
      )),
    ));
  }
}
