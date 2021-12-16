import 'dart:convert';

import 'package:teststore/core/error/exception.dart';
import 'package:teststore/features/home/data/models/home_model.dart';
import 'package:http/http.dart' as http;

abstract class HomeRemoteDataSource {
  /// Calls the https://db2021ecom-edca.restdb.io/rest/main endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<HomeModel> getHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
final http.Client client;

HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<HomeModel> getHomeData() async {
    final url = Uri.parse('https://db2021ecom-edca.restdb.io/rest/main');
    final response = await client.get(url, headers: {'x-apikey':'2aa8e910f6c4ade81a84c9333ffc7bf6a398e'});
    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      final homenData = (result as List).map((homeModelMap) => HomeModel.fromMap(homeModelMap)).toList()[0];
      return homenData;
    } else {
      throw ServerException();
    }
  }

}