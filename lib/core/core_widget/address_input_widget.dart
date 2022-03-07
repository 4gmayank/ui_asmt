import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zip_loan/core/core_widget/space_widget.dart';

import '../../feature/presentation/login_module/login_screen/login_screen.dart';
import '../config/localization.dart';
import '../constants/image_constants.dart';
import '../utils/color_utils.dart';

class AddressInputWidget extends StatefulWidget {
  final String constTitle;
  final TextEditingController? editingController;
  final bool infoIcon;
  final bool showBarrier;
  final bool multiline;

  const AddressInputWidget(
      {Key? key,
      required this.constTitle,
      this.editingController,
      this.showBarrier = false,
        this.multiline= false,
      this.infoIcon = false})
      : super(key: key);

  @override
  _AddressInputWidgetState createState() => _AddressInputWidgetState();
}

class _AddressInputWidgetState extends State<AddressInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              MyLocalizations.of(context).getString(widget.constTitle),
              style: LoginScreenState.normalStyle(
                  fontColor: ColorUtils.appColor,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
          ),
          Visibility(
            visible: widget.showBarrier,
            child: Text(
              " : " ,
              style: LoginScreenState.normalStyle(
                  fontColor: ColorUtils.appColor,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700,
                  fontSize: 22),
            ),
            replacement: SpaceWidget(width: 10),
          ),
          SpaceWidget(height: 10,),
          Flexible(
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
                    controller: widget.editingController,
                    onEditingComplete: () => {},
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 12.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                  Visibility(
                    visible: widget.infoIcon,
                    child: Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                        ImageConstants.INFO_ICON,
                        height: 20,
                      ),
                    ),
                    replacement: Container(
                      height: 20,
                    ),
                  ),
              ],
            ),
          ),
          Visibility(
            visible: widget.multiline,
            child: Flexible(
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
                    Visibility(
                      visible: widget.infoIcon,
                      child: Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          ImageConstants.INFO_ICON,
                          height: 20,
                        ),
                      ),
                      replacement: Container(
                        height: 20,
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
