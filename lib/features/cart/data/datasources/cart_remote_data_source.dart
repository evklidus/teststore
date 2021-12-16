import 'dart:convert';

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
  final http.Client client;
  
  CartRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<CartModel> getCart() async {
    final response = await http.get(Uri.parse('https://db2021ecom-edca.restdb.io/rest/mycart'), headers: {'x-apikey':'2aa8e910f6c4ade81a84c9333ffc7bf6a398e'});
    if (response.statusCode == 200) {
      final jsonCart = json.decode(response.body);
      CartModel cart = (jsonCart as List).map((cart) => CartModel.fromMap(cart)).toList()[0];
      cart.updateItemsCount();
      return cart;
    } else {
      throw ServerException();
    }
  }
}