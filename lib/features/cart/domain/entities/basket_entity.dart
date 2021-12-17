import 'package:equatable/equatable%202.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BasketEntity extends Equatable {
  final String title;
  final String image;
  final int price;
  int count;

  BasketEntity({
    required this.title,
    required this.image,
    required this.price,
    this.count = 1,
  });

  @override
  List<Object> get props => [title, image, price, count];
}
