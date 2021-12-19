import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PhoneInfoTextAndIcon extends StatelessWidget {
  const PhoneInfoTextAndIcon({required this.text, required this.icon, Key? key }) : super(key: key);

  final String text, icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.width / 9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              icon,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      );
  }
}