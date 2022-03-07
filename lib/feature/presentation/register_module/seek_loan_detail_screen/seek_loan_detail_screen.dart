import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/config/localization.dart';
import '../../../../core/core_widget/input_widget.dart';
import '../../../../core/core_widget/next_button.dart';
import '../../../../core/core_widget/space_widget.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/color_utils.dart';
import '../../login_module/login_screen/login_screen.dart';

class SeekLoanScreen extends StatefulWidget {
  const SeekLoanScreen({Key? key}) : super(key: key);

  @override
  _SeekLoanScreenState createState() => _SeekLoanScreenState();
}

class _SeekLoanScreenState extends State<SeekLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: ColorUtils.white,
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    MyLocalizations.of(context).getString("loan_detail"),
                    style: LoginScreenState.normalStyle(
                        fontColor: ColorUtils.appColor,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: 30),
                  ),
                  SpaceWidget(height: 20),
                  _formInput(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: NextButton(
                      isVerify: true,
                      function: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.seek_loan_screen);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _formInput() {
    return Column(
      children: [
        InputWidget(
          constTitle: "amount",
          showBarrier: true,
          infoIcon: true,
        ),
        InputWidget(
          constTitle: "purpose",
          showBarrier: true,
        ),
        InputWidget(
          constTitle: "pan",
          showBarrier: true,
        ),
        uploadPan(),
      ],
    );
  }

  Widget uploadPan() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              MyLocalizations.of(context).getString("pan"),
              style: LoginScreenState.normalStyle(
                  fontColor: ColorUtils.appColor,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
          ),
          Visibility(
            visible: false,
            child: Text(
              " : ",
              style: LoginScreenState.normalStyle(
                  fontColor: ColorUtils.appColor,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
            replacement: SpaceWidget(width: 10),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: ColorUtils.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: ColorUtils.black),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.25),
                        spreadRadius: 0.0,
                        offset: const Offset(0.0, 4.0),
                        blurRadius: 4.0),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      size: 30,
                    ),
                    SpaceWidget(
                      width: 10,
                    ),
                    Text(
                      MyLocalizations.of(context).getString("upload"),
                      style: const TextStyle(
                          color: ColorUtils.textColor,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
