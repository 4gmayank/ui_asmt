import 'package:flutter/cupertino.dart';

class SpaceWidget extends StatelessWidget {
  final double height, width;

  SpaceWidget({
    this.height = 0,
    this.width = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
