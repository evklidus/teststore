// ignore_for_file: non_constant_identifier_names

import 'package:teststore/core/helpers/db_names.dart';
import 'package:teststore/features/cart/data/models/cart_model.dart';
import 'package:sqflite/sqflite.dart';

import '../models/basket_model.dart';

abstract class CartLocalDataSouce {
  /// Gets the cached [List<HomeModel>] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<CartModel> getCart();
  void cartToCache(CartModel cart);
}

class CartLocalDataSouceImpl implements CartLocalDataSouce {
  Database db;

  CartLocalDataSouceImpl({
    required this.db,
  });

  @override
  Future<CartModel> getCart() async {
    return await getCartFromDB(db);
  }

  @override
  cartToCache(CartModel cart) async {
    addCart(cart, db);
  }

  addCart(CartModel cart, Database db) async {
    var database = db;

    await database.insert(cartName, cart.toSQLite(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    for (var phone in cart.basket) {
      await database.insert(
        basketName,
        {
          basket_idForSQL_Arg: 11060 + cart.basket.indexOf(phone),
          basket_title_Arg: phone.title,
          basket_image_Arg: phone.image,
          basket_price_Arg: phone.price,
          basket_count_Arg: phone.count,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<CartModel> getCartFromDB(Database db) async {
    var database = db;

    List<BasketModel> basketItems = [];
    var basketItemsMaps = await database.query(basketName);
    for (var basketItemMap in basketItemsMaps) {
      basketItems.add(
        BasketModel(
          title: basketItemMap[basket_title_Arg],
          image: basketItemMap[basket_image_Arg],
          price: basketItemMap[basket_price_Arg],
          count: basketItemMap[basket_count_Arg],
        ),
      );
    }

    var carts = await database.query(cartName);
    return CartModel(
      id: carts[0][cart_id_Arg],
      basket: basketItems,
      total: carts[0][cart_total_Arg],
      delivery: carts[0][cart_delivery_Arg],
    );
  }
}
