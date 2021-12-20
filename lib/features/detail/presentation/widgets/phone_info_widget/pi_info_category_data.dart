import 'package:flutter/material.dart';
import 'package:teststore/common/app_icons.dart';
import 'package:teststore/features/detail/domain/entities/phone_entity.dart';

import 'pi_text_and_icon.dart';

class PhoneInfoCategoryData extends StatelessWidget {
  const PhoneInfoCategoryData({required this.phone, Key? key})
      : super(key: key);

  final DetailEntity phone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PhoneInfoTextAndIcon(
            text: phone.cpu,
            icon: AppIcons.cpu,
          ),
          PhoneInfoTextAndIcon(
            text: phone.camera,
            icon: AppIcons.camera,
          ),
          PhoneInfoTextAndIcon(
            text: phone.ssd,
            icon: AppIcons.fastMemory,
          ),
          PhoneInfoTextAndIcon(
            text: phone.sd,
            icon: AppIcons.memory,
          ),
        ],
      ),
    );
  }
}
