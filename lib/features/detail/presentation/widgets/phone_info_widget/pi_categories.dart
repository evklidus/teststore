import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';

class PhoneInfoCategories extends StatelessWidget {
  const PhoneInfoCategories({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  'Shop',
                  style: TextStyle(
                    color: AppColors.blueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: AppColors.orangeColor,
                        height: 2.5,
                        width: MediaQuery.of(context).size.width / 5,
                      )),
                ),
              ],
            ),
            const Text(
              'Details',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            const Text(
              'Features',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
          ],
        ),
      );
  }
}