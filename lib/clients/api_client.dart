import 'dart:convert';

import 'package:dio/dio.dart';

class ApiClient {
  final dio = Dio();

  final String apiAddress = 'https://api.unsplash.com';
  final String accessKey = '5NJLuL5mKV_zeHz6RiAfCqAsq4OY5j4gJfpYbMsMN44';
  late Map<String, dynamic> authQueryParams;

  ApiClient() {
    authQueryParams = {
      'client_id': accessKey,
    };
  }

  _validateCodes(int? statusCode) {
    print('Api client: Response status code $statusCode.');
  }

  Future<List<dynamic>?> photosList(int page) async {
    Map<String, dynamic> params = Map.from(authQueryParams)
      ..update(
        'page',
        (value) => page,
        ifAbsent: () => page,
      );
    final response = await dio.get(
      '$apiAddress/photos',
      queryParameters: params,
    );

    if (response.statusCode == 200) {
      return response.data as List<dynamic>;
    } else {
      _validateCodes(response.statusCode);
    }
  }

  Future<List<dynamic>?> searchPhotos(String query, [int page = 1]) async {
    Map<String, dynamic> params = Map.from(authQueryParams)
      ..update('page', (value) => page, ifAbsent: () => page)
      ..update('query', (value) => query, ifAbsent: () => query);
    final response = await dio.get(
      '$apiAddress/search/photos',
      queryParameters: params,
    );

    if (response.statusCode == 200) {
      return ((response.data as Map)['results'] as List);
    } else {
      _validateCodes(response.statusCode);
    }
  }
}
