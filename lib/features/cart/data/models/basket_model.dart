import 'package:teststore/features/cart/domain/entities/basket_entity.dart';

class BasketModel extends BasketEntity {
  BasketModel({
    required title,
    required image,
    required price,
    required count,
  }) : super(
          title: title,
          image: image,
          price: price,
          count: count
        );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'image': image,
      'price': price,
      'count': count,
    };
  }

  Map<String, dynamic> toSQLite() {
    return {
      'title': title,
      'image': image,
      'price': price,
      'count': count,
    };
  }

  factory BasketModel.fromMap(Map<String, dynamic> map) {
    return BasketModel(
      title: map['title'],
      image: map['image'],
      price: map['price'],
      count: 1
    );
  }
}