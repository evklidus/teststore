import 'package:flutter/material.dart';
import 'package:teststore/components/cache_image.dart';
import 'package:teststore/components/shadow.dart';

class PhoneImage extends StatelessWidget {
  const PhoneImage({required this.imageUrl, Key? key}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: ShadowContainer(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: CacheImage(
            imageUrl: imageUrl,
            cover: true,
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
