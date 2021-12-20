// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomColorButton extends StatelessWidget {
  CustomColorButton({required this.onPressed, required this.color, required this.isSelected, Key? key }) : super(key: key);

  Function() onPressed;

  Color color;

  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: color,
              ),
              if (isSelected)
                SvgPicture.asset(
                  'lib/assets/icons/Check.svg',
                ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}