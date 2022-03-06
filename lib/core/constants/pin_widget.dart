import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zip_loan/core/core_widget/space_widget.dart';

import '../../feature/presentation/login_module/login_screen/login_screen.dart';
import '../config/localization.dart';
import '../utils/color_utils.dart';

class PinWidget extends StatefulWidget {
  final TextEditingController pinController;
  final bool autoFill;
  final Function(String)? pinCallback;

  const PinWidget({
    Key? key,
    required this.pinController,
    this.autoFill = false,
    this.pinCallback,
  }) : super(key: key);

  @override
  _PinWidgetState createState() => _PinWidgetState();
}

class _PinWidgetState extends State<PinWidget> {
  bool hidePin = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 40.0, left: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MyLocalizations.of(context).getString("otp").toUpperCase(),
            style: LoginScreenState.normalStyle(
                fontSize: 15, fontWeight: FontWeight.w400),
          ),
          SpaceWidget(height: 10),
          PinCodeTextField(
            onChanged: (value) {},
            appContext: context,
            length: 4,
            controller: widget.pinController,
            enableActiveFill: true,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              activeColor: ColorUtils.shadowColor,
              inactiveColor: ColorUtils.shadowColor,
              selectedColor: ColorUtils.shadowColor,
              activeFillColor: ColorUtils.shadowColor,
              selectedFillColor: ColorUtils.shadowColor,
              inactiveFillColor: ColorUtils.shadowColor,
              borderRadius: BorderRadius.circular(8),
              borderWidth: 0,
              fieldHeight: 40,
              fieldWidth: 40,
            ),
            animationType: AnimationType.fade,
            enablePinAutofill: widget.autoFill,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            animationDuration: Duration(milliseconds: 300),
            onCompleted: (pin) {
              widget.pinCallback!(pin);
            },
            beforeTextPaste: (text) {
              return true;
            },
          ),
        ],
      ),
    );
  }

}
