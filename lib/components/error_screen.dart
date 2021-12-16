import 'package:flutter/material.dart';
import 'package:teststore/common/app_colors.dart';
import 'package:teststore/common/images.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({this.message, this.image, Key? key}) : super(key: key);

  final String? message;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            height: MediaQuery.of(context).size.width / 1.2,
            width: MediaQuery.of(context).size.width / 1.2,
            color: AppColors.blueColor.withOpacity(0.75),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      image ?? Images.unknownFailure,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  message ?? 'Unknown Error',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
