import 'package:flutter/material.dart';

import 'phone_image.dart';

class PhoneImages extends StatelessWidget {
  PhoneImages({required this.images, Key? key}) : super(key: key);

  final List<String> images;

  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 1.35,
      child: PageView(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: images
            .map(
              (imageUrl) => PhoneImage(imageUrl: imageUrl),
            )
            .toList(),
      ),
    );
  }
}
