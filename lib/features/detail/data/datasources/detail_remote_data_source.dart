import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teststore/core/error/exception.dart';

import 'package:teststore/features/detail/data/models/phone_model.dart';

abstract class DetailRemoteDataSource {
  /// Calls the https://db2021ecom-edca.restdb.io/rest/productdetails endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<DetailModel> getDetail();
}

class DetailRemoteDataSourceImpl implements DetailRemoteDataSource {
  final http.Client client;

  DetailRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<DetailModel> getDetail() async {
    final response = await http.get(
        Uri.parse('https://db2021ecom-edca.restdb.io/rest/productdetails'),
        headers: {'x-apikey': '2aa8e910f6c4ade81a84c9333ffc7bf6a398e'});
    if (response.statusCode == 200) {
      final phone = json.decode(response.body);
      return (phone as List)
          .map((jsonPhone) => DetailModel.fromMap(jsonPhone))
          .toList()[0];
    } else {
      throw ServerException();
    }
  }
}
