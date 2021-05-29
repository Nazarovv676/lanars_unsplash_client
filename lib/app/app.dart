import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../clients/api_client.dart';
import '../bloc/photos/photos_bloc.dart';
import '../repos/api_repo.dart';
import '../pages/home_page.dart';

import 'themes.dart' as themes;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ApiRepo(
      apiClient: ApiClient(),
      child: Builder(
        builder: (innerContext) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themes.light,
            home: BlocProvider(
              create: (context) => PhotosBloc(
                apiRepo: ApiRepo.of(innerContext),
              ),
              child: HomePage(),
            ),
          );
        },
      ),
    );
  }
}
