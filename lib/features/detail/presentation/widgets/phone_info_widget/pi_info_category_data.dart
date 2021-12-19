import 'package:flutter/material.dart';
import 'package:teststore/features/detail/domain/entities/phone_entity.dart';

import 'pi_text_and_icon.dart';

class PhoneInfoCategoryData extends StatelessWidget {
  const PhoneInfoCategoryData({required this.phone, Key? key }) : super(key: key);

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
                        icon: 'lib/assets/icons/CPU.svg',
                        ),
                    PhoneInfoTextAndIcon(
                        text: phone.camera,
                        icon: 'lib/assets/icons/Camera.svg',
                        ),
                    PhoneInfoTextAndIcon(
                        text: phone.ssd,
                        icon: 'lib/assets/icons/FastMemory.svg',
                        ),
                    PhoneInfoTextAndIcon(
                        text: phone.sd,
                        icon: 'lib/assets/icons/Memory.svg',
                        ),
                  ],
                ),
              );
  }
}