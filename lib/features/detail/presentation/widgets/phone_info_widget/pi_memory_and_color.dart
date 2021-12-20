import 'package:flutter/material.dart';
import 'package:teststore/features/detail/presentation/widgets/phone_info_widget/custom_color_button.dart';
import 'package:teststore/features/detail/presentation/widgets/phone_info_widget/pi_custom_momory_button.dart';

class MemoryAndColor extends StatefulWidget {
  const MemoryAndColor({required this.colors, required this.capacity, Key? key})
      : super(key: key);

  final List<String> colors, capacity;

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
                    (color) => CustomColorButton(
                      onPressed: () {
                        setState(() {
                          selectedColor = color;
                        });
                      },
                      color: _getColorFromHex(color),
                      isSelected: selectedColor == color,
                    ),
                  )
                  .toList(),
            ),
            Row(
              children: widget.capacity
                  .map(
                    (memory) => CustomMemoryButton(
                      onPressed: () {
                        setState(() {
                          selectedMemory = memory;
                        });
                      },
                      memory: memory,
                      isSelected: selectedMemory == memory,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
