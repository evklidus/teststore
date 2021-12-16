import 'package:equatable/equatable%202.dart';

class BasketEntity extends Equatable {
  String title;
  String image;
  int price;
  int count;

  BasketEntity({
    required this.title,
    required this.image,
    required this.price,
    this.count = 1,
  });

  @override
  List<Object?> get props => [title, image, price, count];
}
