
import 'package:teststore/features/home/domain/entities/best_seller_entity.dart';

class BestSellerPhoneModel extends BestSellerPhoneEntity {
  BestSellerPhoneModel({
    required id,
    required isFavorites,
    required title,
    required priceWithoutDiscount,
    required discountPrice,
    required picture,
  }) : super(
          id: id,
          isFavorites: isFavorites,
          title: title,
          priceWithoutDiscount: priceWithoutDiscount,
          discountPrice: discountPrice,
          picture: picture,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isFavorites': isFavorites,
      'title': title,
      'priceWithoutDiscount': priceWithoutDiscount,
      'discountPrice': discountPrice,
      'picture': picture,
    };
  }
  Map<String, dynamic> toSQLite() {
    return {
      'id': id,
      'isFavorites': isFavorites ? 1 : 0,
      'title': title,
      'priceWithoutDiscount': priceWithoutDiscount,
      'discountPrice': discountPrice,
      'picture': picture,
    };
  }

  factory BestSellerPhoneModel.fromMap(Map<String, dynamic> map) {
    return BestSellerPhoneModel(
      id: map['id'],
      isFavorites: map['is_favorites'] ?? false,
      title: map['title'],
      priceWithoutDiscount: map['price_without_discount'],
      discountPrice: map['discount_price'],
      picture: map['picture'],
    );
  }
}