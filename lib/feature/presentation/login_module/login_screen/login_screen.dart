import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:zip_loan/core/constants/pin_widget.dart';
import 'package:zip_loan/core/core_widget/space_widget.dart';

import '../../../../core/config/localization.dart';
import '../../../../core/constants/image_constants.dart';
import '../../../../core/core_widget/next_button.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/color_utils.dart';
import '../../../../core/utils/font_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileNumberInputController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Visibility(
                  visible: WidgetsBinding.instance != null && WidgetsBinding.instance?.window.viewInsets.bottom==0.0,
                  child: _bannerBox()),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: ColorUtils.bgColor.withOpacity(.85),
                        borderRadius: BorderRadius.circular(40.0),
                        border: Border.all(color: ColorUtils.black),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(.25),
                              spreadRadius: 0.0,
                              offset: const Offset(0.0, 4.0),
                              blurRadius: 4.0),
                        ],
                      ),
                      //margin: EdgeInsets.only(right: 20.0),
                      child: TextFormField(
                        validator: (value) => value == null || value.isEmpty
                            ? null
                            : (RegExp('[\\d{10}]').hasMatch(value)
                                ? null
                                : MyLocalizations.of(context)
                                    .getString('enter_valid_mobile_number')),
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.number,
                        controller: _mobileNumberInputController,
                        inputFormatters: [
                          MaskTextInputFormatter(
                              mask: 'd#########', filter: {"#": RegExp(r'[0-9]'), "d": RegExp(r'[7-9]')}),
                        ],
                        onEditingComplete: () => {},
                        decoration: InputDecoration(
                          hintText:
                              MyLocalizations.of(context).getString("mobile_number"),
                          hintStyle: LoginScreenState.normalStyle(fontColor: ColorUtils.appColor, fontSize: 15),
                          contentPadding: const EdgeInsets.only(left: 12.0),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SpaceWidget(height: 10),
                    Text(
                      MyLocalizations.of(context).getString("otp_send_info_msg"),
                      style: LoginScreenState.normalStyle(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    SpaceWidget(height: 30),
                   PinWidget(pinController: _pinController),
                    SpaceWidget(height: 40),
                    NextButton(
                      function: () {
                        Navigator.of(context).pushNamed(
                            AppRoutes.personal_detail_screen);
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bannerBox() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  ImageConstants.ZIP_LOAN_ICON,
                  height: 36,
                ),
                Text(
                    MyLocalizations.of(context)
                        .getString("app_name")
                        .toLowerCase(),
                    style: LoginScreenState.normalStyle(
                        fontSize: 70, fontWeight: FontWeight.w700)),
              ],
            ),
            SpaceWidget(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                  MyLocalizations.of(context)
                      .getString("welcome_ziploan")
                      .toLowerCase(),
                  style: LoginScreenState.normalStyle(
                      fontSize: 30,
                      fontColor: ColorUtils.white,
                      fontWeight: FontWeight.w700)),
            ),
            SpaceWidget(height: 20),
            Text(
              MyLocalizations.of(context).getString("sign_up_info_msg"),
              style: LoginScreenState.normalStyle(
                  fontSize: 20,
                  fontColor: ColorUtils.white,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  static TextStyle normalStyle(
      {double letterSpacing = 0,
      double height = 1,
      double fontSize = 12.0,
      Color fontColor = ColorUtils.textColor,
      FontStyle fontStyle = FontStyle.normal,
      String fontFamily = FontStyles.FONT_HEADLINE,
      FontWeight fontWeight = FontWeight.w400,
      bool isUnderline = false}) {
    return _normalFontStyle(
      letterSpacing: letterSpacing,
      height: height,
      fontSize: fontSize,
      fontColor: fontColor,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle _normalFontStyle(
      {double fontSize = 12.0,
      double height = 1,
      double letterSpacing = 0,
      Color fontColor = ColorUtils.textColor,
      FontWeight fontWeight = FontWeight.normal,
      FontStyle fontStyle = FontStyle.normal,
      String fontFamily = FontStyles.FONT_HEADLINE,
      TextDecoration decoration = TextDecoration.none}) {
    return TextStyle(
      height: height,
      letterSpacing: letterSpacing,
      fontFamily: fontFamily,
      color: fontColor,
      fontStyle: fontStyle,
      fontSize: fontSize,
      fontWeight: fontWeight,
      decoration: decoration,
    );
  }
}
