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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
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
    );
  }

  Widget _formInput() {
    return Column(
      children: const [
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
        InputWidget(
          constTitle: "pan",
        ),
      ],
    );
  }
}
