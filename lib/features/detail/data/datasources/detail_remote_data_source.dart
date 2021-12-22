import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:teststore/core/error/exception.dart';
import 'package:teststore/core/helpers/network/rest_api_client.dart';

import 'package:teststore/features/detail/data/models/phone_model.dart';

abstract class DetailRemoteDataSource {
  /// Calls the https://db2021ecom-edca.restdb.io/rest/productdetails endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<DetailModel> getDetail();
}

class DetailRemoteDataSourceImpl implements DetailRemoteDataSource {
  final RestClient client;

  DetailRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<DetailModel> getDetail() async {
    var listDetails = await client.getDetail();
    return listDetails[0];
  }
}
