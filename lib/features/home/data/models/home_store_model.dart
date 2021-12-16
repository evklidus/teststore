
import 'package:teststore/features/home/domain/entities/home_store_entity.dart';

class HomeStorePhoneModel extends HomeStorePhoneEntity {
  HomeStorePhoneModel({
    required id,
    required isNew,
    required isFavorites,
    required title,
    required subtitle,
    required picture,
    required isBuy,
  }) : super(
          id: id,
          isNew: isNew,
          isFavorites: isFavorites,
          title: title,
          subtitle: subtitle,
          picture: picture,
          isBuy: isBuy,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isNew': isNew,
      'isFavorites': isFavorites,
      'title': title,
      'subtitle': subtitle,
      'picture': picture,
      'isBuy': isBuy,
    };
  }
  Map<String, dynamic> toSQLite() {
    return {
      'id': id,
      'isNew': isNew ? 1 : 0,
      'isFavorites': isFavorites ? 1 : 0,
      'title': title,
      'subtitle': subtitle,
      'picture': picture,
      'isBuy': isBuy ? 1 : 0,
    };
  }

  factory HomeStorePhoneModel.fromMap(Map<String, dynamic> map) {
    return HomeStorePhoneModel(
      id: map['id'],
      isNew: map['is_new'] ?? false,
      isFavorites: map['is_favorites'] ?? false,
      title: map['title'],
      subtitle: map['subtitle'],
      picture: map['picture'],
      isBuy: map['is_buy'],
    );
  }
}