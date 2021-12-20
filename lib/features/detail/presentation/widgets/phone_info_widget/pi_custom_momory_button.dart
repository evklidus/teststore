// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';

class CustomMemoryButton extends StatelessWidget {
  CustomMemoryButton(
      {required this.onPressed,
      required this.memory,
      required this.isSelected,
      Key? key})
      : super(key: key);

  Function() onPressed;

  String memory;

  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              color: isSelected ? AppColors.orangeColor : null,
              child: Text(
                memory,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
