// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teststore/core/helpers/db_names.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "database.db");

    var theDb = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Home Data
        await db.execute('''
        CREATE TABLE IF NOT EXISTS $homeName(
          $home_idForSQL_Arg INTEGER PRIMARY KEY,
          $home_id_Arg TEXT NOT NULL)''');
        await db.execute('''
        CREATE TABLE IF NOT EXISTS $bestSellerPhoneName(
          $bestSellerPhone_id_Arg INTEGER PRIMARY KEY,
          $bestSellerPhone_isFavorites_Arg INT NOT NULL,
          $bestSellerPhone_title_Arg TEXT NOT NULL,
          $bestSellerPhone_priceWithoutDiscount_Arg INT NOT NULL,
          $bestSellerPhone_discountPrice_Arg INT NOT NULL,
          $bestSellerPhone_picture_Arg TEXT NOT NULL)''');
        await db.execute('''
        CREATE TABLE IF NOT EXISTS $homeStorePhoneName(
          $homeStorePhone_id_Arg INTEGER PRIMARY KEY,
          $homeStorePhone_isNew_Arg INT NOT NULL,
          $homeStorePhone_isFavorites_Arg INT NOT NULL,
          $homeStorePhone_title_Arg TEXT NOT NULL,
          $homeStorePhone_subtitle_Arg TEXT NOT NULL,
          $homeStorePhone_picture_Arg TEXT NOT NULL,
          $homeStorePhone_isBuy_Arg INT NOT NULL)''');

        // Detail Data
        await db.execute('''
        CREATE TABLE IF NOT EXISTS $detailName(
          $detail_idForSQL_Arg INTEGER PRIMARY KEY,
          $detail_id_Arg TEXT NOT NULL,
          $detail_isFavorites_Arg INT NOT NULL,
          $detail_title_Arg TEXT NOT NULL,
          $detail_rating_Arg TEXT NOT NULL,
          $detail_cpu_Arg TEXT NOT NULL,
          $detail_camera_Arg TEXT NOT NULL,
          $detail_ssd_Arg TEXT NOT NULL,
          $detail_sd_Arg TEXT NOT NULL,
          $detail_price_Arg INT NOT NULL)''');
        await db.execute('''
        CREATE TABLE IF NOT EXISTS $imageName(
          $image_id_Arg INTEGER PRIMARY KEY,
          $imageArg TEXT NOT NULL)''');
        await db.execute('''
        CREATE TABLE IF NOT EXISTS $colorName(
          $color_id_Arg INTEGER PRIMARY KEY,
          $colorArg TEXT NOT NULL)''');
        await db.execute('''
        CREATE TABLE IF NOT EXISTS $capacitylName(
          $capacity_id_Arg INTEGER PRIMARY KEY,
          $capacitylArg TEXT NOT NULL)''');

        // Cart Data
        await db.execute('''
        CREATE TABLE IF NOT EXISTS $cartName(
          $cart_idForSQL_Arg INTEGER PRIMARY KEY,
          $cart_id_Arg TEXT NOT NULL,
          $cart_total_Arg INT NOT NULL,
          $cart_delivery_Arg TEXT NOT NULL)''');
        await db.execute('''
        CREATE TABLE IF NOT EXISTS $basketName(
          $cart_idForSQL_Arg INTEGER PRIMARY KEY,
          $basket_title_Arg TEXT NOT NULL,
          $basket_image_Arg TEXT NOT NULL,
          $basket_price_Arg INT NOT NULL,
          $basket_count_Arg INT NOT NULL)''');
      },
    );
    return theDb;
  }
}
