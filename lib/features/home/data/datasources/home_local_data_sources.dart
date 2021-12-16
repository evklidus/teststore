import 'package:teststore/core/helpers/database/db_names.dart';
import 'package:teststore/features/home/data/models/best_seller_model.dart';
import 'package:teststore/features/home/data/models/home_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teststore/features/home/data/models/home_store_model.dart';

abstract class HomeLocalDataSouce {
  /// Gets the cached [List<HomeModel>] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<HomeModel> getHomeData();
  void homeDataToCache(HomeModel homeData);
}

class HomeLocalDataSouceImpl implements HomeLocalDataSouce {
  Database db;

  HomeLocalDataSouceImpl({
    required this.db,
  });

  @override
  Future<HomeModel> getHomeData() async {
    return await getHomeDataFromDB(db);
  }

  @override
  homeDataToCache(HomeModel homeData) async {
    addHomeDataFromDB(homeData, db);
  }

  addHomeDataFromDB(HomeModel homeData, Database db) async {
    var database = db;

    await database.insert(
      homeName,
      {home_idForSQL_Arg: 110700, home_id_Arg: homeData.id},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    for (var homeStorePhone in homeData.homeStorePhones) {
      await database.insert(homeStorePhoneName, homeStorePhone.toSQLite(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    for (var bestSellerPhone in homeData.bestSellerPhones) {
      await database.insert(bestSellerPhoneName, bestSellerPhone.toSQLite(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<HomeModel> getHomeDataFromDB(Database db) async {
    var database = db;

    List<HomeStorePhoneModel> homeStorePhones = [];
    var homeStorePhonesMaps = await database.query(homeStorePhoneName);
    for (var homeStorePhoneMap in homeStorePhonesMaps) {
      homeStorePhones.add(
        HomeStorePhoneModel(
          id: homeStorePhoneMap[homeStorePhone_id_Arg],
          isNew:
              homeStorePhoneMap[homeStorePhone_isNew_Arg] == 1 ? true : false,
          isFavorites: homeStorePhoneMap[homeStorePhone_isFavorites_Arg] == 1
              ? true
              : false,
          title: homeStorePhoneMap[homeStorePhone_title_Arg],
          subtitle: homeStorePhoneMap[homeStorePhone_subtitle_Arg],
          picture: homeStorePhoneMap[homeStorePhone_picture_Arg],
          isBuy:
              homeStorePhoneMap[homeStorePhone_isBuy_Arg] == 1 ? true : false,
        ),
      );
    }

    List<BestSellerPhoneModel> bestSellerPhones = [];
    var bestSellerPhonesMaps = await database.query(bestSellerPhoneName);
    for (var bestSellerPhoneMap in bestSellerPhonesMaps) {
      bestSellerPhones.add(
        BestSellerPhoneModel(
          id: bestSellerPhoneMap[bestSellerPhone_id_Arg],
          isFavorites: bestSellerPhoneMap[bestSellerPhone_isFavorites_Arg] == 1
              ? true
              : false,
          title: bestSellerPhoneMap[bestSellerPhone_title_Arg],
          priceWithoutDiscount:
              bestSellerPhoneMap[bestSellerPhone_priceWithoutDiscount_Arg],
          discountPrice: bestSellerPhoneMap[bestSellerPhone_discountPrice_Arg],
          picture: bestSellerPhoneMap[bestSellerPhone_picture_Arg],
        ),
      );
    }

    var homesMaps = await database.query(homeName);
    return HomeModel(
        id: homesMaps[0][home_id_Arg],
        homeStorePhones: homeStorePhones,
        bestSellerPhones: bestSellerPhones);
  }
}
