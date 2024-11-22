import 'package:flutter/material.dart';

extension PaddingFunctions on Widget {
  Widget onPadL(double val) => Padding(
        padding: EdgeInsets.only(left: val),
        child: this,
      );
  Widget onPadR(double val) => Padding(
        padding: EdgeInsets.only(right: val),
        child: this,
      );
  Widget onPadT(double val) => Padding(
        padding: EdgeInsets.only(top: val),
        child: this,
      );
  Widget onPadB(double val) => Padding(
        padding: EdgeInsets.only(bottom: val),
        child: this,
      );
  Widget onPadSym(double hori, double vert) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: hori,
          vertical: vert,
        ),
        child: this,
      );
}

extension OnTapFunctionality on Widget {
  Widget onTap(VoidCallback ontap) => GestureDetector(
        onTap: ontap,
        child: this,
      );
}
