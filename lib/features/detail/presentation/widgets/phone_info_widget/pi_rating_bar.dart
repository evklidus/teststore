import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PhoneInfoRatingBar extends StatelessWidget {
  const PhoneInfoRatingBar({required this.rating, Key? key}) : super(key: key);

  final double rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1,
      child: Row(
        children: [
          RatingBar.builder(
            initialRating: rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 18,
            ignoreGestures: true,
            itemPadding: const EdgeInsets.only(right: 4),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              // print(rating);
            },
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
