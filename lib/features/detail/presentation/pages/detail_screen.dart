import 'package:flutter/material.dart';
import 'package:teststore/features/detail/domain/entities/phone_entity.dart';
import 'package:teststore/features/detail/presentation/widgets/phone%20images/phone_images.dart';
import 'package:teststore/features/detail/presentation/widgets/top%20bar/top_bar.dart';

import '../widgets/phone_info_widget/main_widget/phone_info.dart';


class DetailsScreen extends StatelessWidget {
  DetailsScreen({required this.phone, Key? key}) : super(key: key);

  final DetailEntity phone;

  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopBar(),
          PhoneImages(images: phone.images),
          PhoneInfo(phone: phone),
        ],
      ),
    );
  }
}
