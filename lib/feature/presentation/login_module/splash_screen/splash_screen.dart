import 'package:flutter/material.dart';
import 'package:zip_loan/core/constants/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      // height: MediaQuery.of(context).size.height,
      // width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Image.asset(ImageConstants.SPLASH),
    );
    // child: Text("Ziploan",
    //
    //   style: TextStyle(
    //   color: ColorUtils.appColor,
    //     decoration: TextDecoration.none,
    //
    // ),));
  }
}
