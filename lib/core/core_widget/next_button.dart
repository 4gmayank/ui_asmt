import 'package:flutter/material.dart';

import '../config/localization.dart';
import '../utils/color_utils.dart';

class NextButton extends StatelessWidget {
  final bool isVerify;

  const NextButton({Key? key, this.isVerify = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: ColorUtils.appColor,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: ColorUtils.black),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.25),
              spreadRadius: 0.0,
              offset: const Offset(0.0, 4.0),
              blurRadius: 4.0),
        ],
      ),
      child: Text(
        MyLocalizations.of(context).getString("continue"),
        style: const TextStyle(
            color: ColorUtils.white,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
            fontSize: 20),
      ),
    );
  }
}
