
// ignore_for_file: unused_import

import 'dart:convert';

import 'package:teststore/features/home/domain/entities/home_entity.dart';

import 'best_seller_model.dart';
import 'home_store_model.dart';

class HomeModel extends HomeEntity<HomeStorePhoneModel, BestSellerPhoneModel> {
  HomeModel({
    required id,
    required List<HomeStorePhoneModel> homeStorePhones,
    required List<BestSellerPhoneModel> bestSellerPhones,
  }) : super(id: id, homeStorePhones: homeStorePhones, bestSellerPhones: bestSellerPhones);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'homeStore':
          homeStorePhones.map((homeStorePhone) => homeStorePhone.toMap()).toList(),
      'bestSeller':
          bestSellerPhones.map((bestSellerPhone) => bestSellerPhone.toMap()).toList(),
    };
  }
  Map<String, dynamic> toSQLite() {
    return {
      'id': id,
      'homeStorePhones':
          homeStorePhones.map((homeStorePhone) => homeStorePhone.toMap()).toList().toString(),
      'bestSellerPhones':
          bestSellerPhones.map((bestSellerPhone) => bestSellerPhone.toMap()).toList().toString(),
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      id: map['_id'],
      homeStorePhones: (map['home_store'] as List<dynamic>).map((homeStoreItem) => HomeStorePhoneModel.fromMap(homeStoreItem)).toList(),
      bestSellerPhones: (map['best_seller'] as List<dynamic>).map((bestSellerItem) => BestSellerPhoneModel.fromMap(bestSellerItem)).toList(),
    );
  }
  // factory HomeModel.fromSQLite(Map<String, dynamic> map) {
  //   return HomeModel(
  //     id: map['id'],
  //     homeStorePhones: (map['home_store'] as List<dynamic>).map((homeStoreItem) => HomeStorePhoneModel.fromMap(homeStoreItem)).toList(),
  //     bestSellerPhones: (map['best_seller'] as List<dynamic>).map((bestSellerItem) => BestSellerPhoneModel.fromMap(bestSellerItem)).toList(),
  //   );
  // }
}