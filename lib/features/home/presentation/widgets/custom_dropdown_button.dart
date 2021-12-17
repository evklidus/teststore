import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({required this.title, required this.labelText, Key? key }) : super(key: key);

  final String title, labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.blueColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        DropdownButtonFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
          items: [
            if (title == 'Price')
              const DropdownMenuItem(
                child: Text('\$0 - \$300'),
                value: '\$0 - \$300',
              ),
            DropdownMenuItem(
              child: Text(labelText),
              value: labelText,
            ),
            if (title == 'Price')
              const DropdownMenuItem(
                child: Text('\$500 - \$10000'),
                value: '\$500 - \$10000',
              ),
          ],
          onChanged: (data) {},
        ),
      ],
    );
  }
}