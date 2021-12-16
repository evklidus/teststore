import 'package:teststore/features/detail/domain/entities/phone_entity.dart';

class DetailModel extends DetailEntity {
  DetailModel({
    required id,
    required images,
    required isFavorites,
    required title,
    required rating,
    required cpu,
    required camera,
    required ssd,
    required sd,
    required color,
    required capacity,
    required price,
  }) : super(
          id: id,
          images: images,
          isFavorites: isFavorites,
          title: title,
          rating: rating,
          cpu: cpu,
          camera: camera,
          ssd: ssd,
          sd: sd,
          color: color,
          capacity: capacity,
          price: price,
        );

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'images': images,
      'isFavorites': isFavorites,
      'title': title,
      'rating': rating,
      'cPU': cpu,
      'camera': camera,
      'ssd': ssd,
      'sd': sd,
      'color': color,
      'capacity': capacity,
      'price': price,
    };
  }
  Map<String, dynamic> toSQLite() {
    return {
      'id_sql': 1101,
      'id': id,
      'isFavorites': isFavorites ? 1 : 0,
      'title': title,
      'rating': rating.toString(),
      'cpu': cpu,
      'camera': camera,
      'ssd': ssd,
      'sd': sd,
      'price': price,
    };
  }

  factory DetailModel.fromMap(Map<String, dynamic> map) {
    return DetailModel(
      id: map['_id'],
      images: List<String>.from(map['images']),
      isFavorites: map['is_favorites'],
      title: map['title'],
      rating: map['rating'],
      cpu: map['CPU'],
      camera: map['camera'],
      ssd: map['ssd'],
      sd: map['sd'],
      color: List<String>.from(map['color']),
      capacity: List<String>.from(map['capacity']),
      price: map['price'],
    );
  }
}
