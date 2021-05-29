import 'package:flutter/material.dart';

import '../models/photo_model.dart';
import '../clients/api_client.dart';

///Works with unsplash API client
class ApiRepo extends InheritedWidget {
  ///API client
  final ApiClient apiClient;

  ApiRepo({
    Key? key,
    required this.apiClient,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  Future<List<Photo>> photos({int page = 1}) async {
    final List response = await apiClient.photosList(page) ?? [];
    final photo = response
        .map((e) => Photo(
              id: e['id'],
              small: e['urls']['small'],
              regular: e['urls']['regular'],
              full: e['urls']['full'],
              userName: e['user']['name'],
              likes: e['likes'],
              blurHash: e['blur_hash'],
            ))
        .toList();
    return photo;
  }

  static ApiRepo of(BuildContext context) {
    final ApiRepo? result =
        context.dependOnInheritedWidgetOfExactType<ApiRepo>();
    assert(result != null, 'No ApiRepo found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget _) {
    return false;
  }
}
