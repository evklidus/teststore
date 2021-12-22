import 'dart:convert';

import 'package:teststore/core/helpers/network/rest_api_client.dart';

import '../../../../core/error/exception.dart';
import '../models/cart_model.dart';

import 'package:http/http.dart' as http;

abstract class CartRemoteDataSource {
    /// Calls the https://db2021ecom-edca.restdb.io/rest/mycart endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CartModel> getCart();
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final RestClient client;
  
  CartRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<CartModel> getCart() async {
    var listCarts = await client.getCart();
    var cart = listCarts[0];
    cart.updateItemsCount(); // improving data from api
    return cart;
  }
}