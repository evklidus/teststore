import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopButton extends StatelessWidget {
  const TopButton({required this.icon, required this.color, Key? key }) : super(key: key);

  final String icon;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: MediaQuery.of(context).size.width / 10,
        width: MediaQuery.of(context).size.width / 10,
        padding: const EdgeInsets.all(10),
        color: color,
        child: SvgPicture.asset(
          icon,
        ),
      ),
    );
  }
}