import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zip_loan/core/constants/image_constants.dart';

import '../../../../core/constants/config.dart';
import '../../../../core/utils/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: Config.SPLASH_TIME), () {
      Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login_screen, (Route<dynamic> route) => false);
    });
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Image.asset(ImageConstants.SPLASH),
    );
  }
}
