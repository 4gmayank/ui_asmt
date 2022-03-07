import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zip_loan/core/core_widget/input_widget.dart';
import 'package:zip_loan/core/core_widget/space_widget.dart';
import 'package:zip_loan/feature/presentation/login_module/login_screen/login_screen.dart';

import '../../../../core/config/localization.dart';
import '../../../../core/core_widget/address_input_widget.dart';
import '../../../../core/core_widget/next_button.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/color_utils.dart';

class BusinessDetailScreen extends StatefulWidget {
  const BusinessDetailScreen({Key? key}) : super(key: key);

  @override
  _BusinessDetailScreenState createState() => _BusinessDetailScreenState();
}

class _BusinessDetailScreenState extends State<BusinessDetailScreen> {
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
                    MyLocalizations.of(context).getString("business_details"),
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
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  MyLocalizations.of(context).getString("gst"),
                  style: LoginScreenState.normalStyle(
                      fontColor: ColorUtils.appColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 22),
                ),
              ),
              Flexible(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
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
                        child: TextFormField(
                          onEditingComplete: () => {},
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 12.0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                decoration: BoxDecoration(
                  color: ColorUtils.appColor,
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
                child: Text(
                  MyLocalizations.of(context).getString("verify"),
                  style: const TextStyle(
                      color: ColorUtils.white,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      fontSize: 20),
                ),
              )
            ],
          ),
          SpaceWidget(height: 30,),
          AddressInputWidget(constTitle: "business_name"),
          AddressInputWidget(
            constTitle: "business_address",
            multiline: true,
          ),
          InputWidget(constTitle: "mobile_number"),
          InputWidget(
            constTitle: "email",
            infoIcon: true,
          ),
        ],
      ),
    );
  }
}

