import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:teststore/common/app_colors.dart';

class MemoryAndColor extends StatefulWidget {
  MemoryAndColor({required this.colors, required this.capacity, Key? key})
      : super(key: key);

  List<String> colors;
  List<String> capacity;

  @override
  State<MemoryAndColor> createState() => _MemoryAndColorState();
}

class _MemoryAndColorState extends State<MemoryAndColor> {
  String selectedColor = '#772D03';

  String selectedMemory = '128 GB';

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Colors.lime;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 12,
      child: Padding(
        padding: const EdgeInsets.only(right: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: widget.colors
                  .map(
                    (color) => _cusomColorButton(
                      color,
                      selectedColor == color,
                    ),
                  )
                  .toList(),
            ),
            Row(
              children: widget.capacity
                  .map(
                    (memory) => _cusomMemoryButton(
                      memory,
                      selectedMemory == memory,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cusomColorButton(String color, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: _getColorFromHex(color),
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

  Widget _cusomMemoryButton(String memory, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedMemory = memory;
        });
      },
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
