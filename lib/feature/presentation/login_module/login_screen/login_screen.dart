import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:zip_loan/core/utils/font_styles.dart';

import '../../../../core/config/localization.dart';
import '../../../../core/constants/config.dart';
import '../../../../core/core_widget/next_button.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/color_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _mobileNumberInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              _bannerBox(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                //margin: EdgeInsets.only(right: 20.0),
                child: TextFormField(
                  validator: (value) => value == null || value.isEmpty
                      ? null
                      : (RegExp('[\\d{10}]')
                      .hasMatch(value)
                      ? null
                      : MyLocalizations.of(context)
                      .getString('enter_valid_mobile_number')),

                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                  controller: _mobileNumberInputController,
                  onEditingComplete: () => {},
                  decoration: InputDecoration(
                    hintText: MyLocalizations.of(context).getString("mobile_number"),
                    contentPadding: EdgeInsets.only(left: 12.0),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              Text(
                MyLocalizations.of(context).getString("otp_send_info_msg"),
                style: const TextStyle(
                    color: ColorUtils.textColor,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontSize: 20),
              ),
              Row(
                children: [
                  Text(
                    MyLocalizations.of(context).getString("otp").toUpperCase(),
                    style: const TextStyle(
                        color: ColorUtils.textColor,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 20),
                  ),
                ],
              ),
              NextButton(
                function: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.seek_loan_screen, (Route<dynamic> route) => false);
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bannerBox(){
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(right: 2),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ColorUtils.appColor.withOpacity(.85),
          border: Border.all(color: ColorUtils.black),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                spreadRadius: 0.0,
                offset: const Offset(0.0, 4.0),
                blurRadius: 4.0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              MyLocalizations.of(context).getString("sign_up_info_msg"),
              style: textStyle(),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle textStyle(){
    return const TextStyle(
        color: ColorUtils.textColor,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
        fontSize: 20);
  }
}
