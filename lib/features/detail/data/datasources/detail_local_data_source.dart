import 'package:teststore/core/helpers/database/db_names.dart';
import 'package:teststore/features/detail/data/models/phone_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class DetailLocalDataSouce {
  /// Gets the cached [List<HomeModel>] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<DetailModel> getDetail();
  void detailsToCache(DetailModel detail);
}

class DetailLocalDataSouceImpl implements DetailLocalDataSouce {
  Database db;

  DetailLocalDataSouceImpl({
    required this.db,
  });

  @override
  Future<DetailModel> getDetail() async {
    return await getDetailFromDB(db);
  }

  @override
  detailsToCache(DetailModel detail) async {
    addDetailToDB(detail, db);
  }

  addDetailToDB(DetailModel detail, Database db) async {
    var database = db;

    await database.insert(detailName, detail.toSQLite(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    for (var imageUrl in detail.images) {
      await database.insert(
          imageName,
          {
            image_id_Arg: 11020 + detail.images.indexOf(imageUrl),
            imageArg: imageUrl
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    for (var hex in detail.color) {
      await database.insert(colorName,
          {color_id_Arg: 11030 + detail.color.indexOf(hex), colorArg: hex},
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
    for (var memory in detail.capacity) {
      await database.insert(
          capacitylName,
          {
            capacity_id_Arg: 11040 + detail.capacity.indexOf(memory),
            capacitylArg: memory
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  Future<DetailModel> getDetailFromDB(Database db) async {
    var database = db;

    List<String> images = [];
    var imagesMaps = await database.query(imageName);
    for (var imageMap in imagesMaps) {
      images.add(
        imageMap[imageArg] as String,
      );
    }

    List<String> colors = [];
    var colorsMaps = await database.query(colorName);
    for (var colorMap in colorsMaps) {
      colors.add(
        colorMap[colorArg] as String,
      );
    }

    List<String> capacities = [];
    var capacitysMaps = await database.query(capacitylName);
    for (var capacityMap in capacitysMaps) {
      capacities.add(
        capacityMap[capacitylArg] as String,
      );
    }

    var detailsMaps = await database.query(detailName);
    return DetailModel(
      id: detailsMaps[0][detail_id_Arg],
      images: images,
      isFavorites: detailsMaps[0][detail_isFavorites_Arg] == 1 ? true : false,
      title: detailsMaps[0][detail_title_Arg],
      rating: double.parse(detailsMaps[0][detail_rating_Arg] as String),
      cpu: detailsMaps[0][detail_cpu_Arg],
      camera: detailsMaps[0][detail_camera_Arg],
      ssd: detailsMaps[0][detail_ssd_Arg],
      sd: detailsMaps[0][detail_sd_Arg],
      color: colors,
      capacity: capacities,
      price: detailsMaps[0][detail_price_Arg],
    );
  }
}
