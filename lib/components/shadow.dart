import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget ShadowContainer({required Widget child, double radius = 5, bool moreShadow = false, Color color = Colors.white, double paddingValue = 5, EdgeInsets? customPadding, bool isCircle = false, bool topRounded = false}) {
    return Container(
      padding: customPadding ?? EdgeInsets.all(paddingValue),
      child: child,
      decoration: BoxDecoration(
        color: color,
        borderRadius: topRounded ? const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)) : (isCircle ? null : BorderRadius.circular(radius)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(moreShadow ? 0.25 : 0.15),
            spreadRadius: moreShadow ? 2.5 : 1.5,
            blurRadius: 10,
          ),
        ],
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      ),
    );
  }