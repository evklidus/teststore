import 'package:teststore/features/cart/domain/entities/basket_entity.dart';

// ignore: must_be_immutable
class BasketModel extends BasketEntity {
  BasketModel({
    required final title,
    required final image,
    required final price,
    required count,
  }) : super(
          title: title,
          image: image,
          price: price,
          count: count
        );

  Map<String, dynamic> toJson() {
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

  factory BasketModel.fromJson(Map<String, dynamic> map) {
    return BasketModel(
      title: map['title'],
      image: map['image'],
      price: map['price'],
      count: 1
    );
  }
}
