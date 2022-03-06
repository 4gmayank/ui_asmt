import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/core_widget/next_button.dart';

class SeekLoanScreen extends StatefulWidget {
  const SeekLoanScreen({Key? key}) : super(key: key);

  @override
  _SeekLoanScreenState createState() => _SeekLoanScreenState();
}

class _SeekLoanScreenState extends State<SeekLoanScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: const [
              NextButton(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
