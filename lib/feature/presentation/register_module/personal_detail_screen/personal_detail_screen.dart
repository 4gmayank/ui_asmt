import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/config/localization.dart';
import '../../../../core/core_widget/input_widget.dart';
import '../../../../core/core_widget/next_button.dart';
import '../../../../core/core_widget/space_widget.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/color_utils.dart';

class PersonalDetailScreen extends StatefulWidget {
  const PersonalDetailScreen({Key? key}) : super(key: key);

  @override
  _PersonalDetailScreenState createState() => _PersonalDetailScreenState();
}

class _PersonalDetailScreenState extends State<PersonalDetailScreen> {
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
                  MyLocalizations.of(context).getString("personal_details"),
                  style: const TextStyle(
                      color: ColorUtils.appColor,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.none,
                      fontSize: 30),
                ),
                SpaceWidget(height: 20),
                _formInput(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: NextButton(
                    isVerify: true,
                    function: () {
                      Navigator.of(context).pushNamed(
                          AppRoutes.business_detail_screen);
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
        InputWidget(constTitle: "amount"),
        InputWidget(constTitle: "name"),
        InputWidget(constTitle: "dob", infoIcon: true,),
        InputWidget(constTitle: "address"),
        InputWidget(constTitle: "pin_code", infoIcon: true,),
        InputWidget(constTitle: "email"),
      ],
    );
  }
}
