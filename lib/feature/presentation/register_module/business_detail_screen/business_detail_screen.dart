import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zip_loan/core/core_widget/input_widget.dart';
import 'package:zip_loan/core/core_widget/space_widget.dart';
import 'package:zip_loan/feature/presentation/login_module/login_screen/login_screen.dart';

import '../../../../core/config/localization.dart';
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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
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
    );
  }

  Widget _formInput() {
    return Column(
      children: const [
        InputWidget(constTitle: "gst"),
        InputWidget(constTitle: "business_name"),
        InputWidget(constTitle: "business_address", infoIcon: true,),
        InputWidget(constTitle: "mobile_number"),
        InputWidget(constTitle: "email", infoIcon: true,),
      ],
    );
  }
}
