import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/photo_model.dart';
import '../bloc/photos_bloc.dart';
import '../components/photo_tile.dart';

class HomePage extends StatelessWidget {
  final rand = Random();
  HomePage({Key? key}) : super(key: key);

  final refreshKey = GlobalKey<RefreshIndicatorState>();

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PhotosBloc>(context).add(PhotosRequested(
      page: rand.nextInt(100),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unsplash gallery'),
      ),
      body: Center(
        child: BlocBuilder<PhotosBloc, PhotosState>(
          builder: (context, state) {
            if (state is PhotosInitial) {
              //if program started
              _onRefresh(context);
              return CircularProgressIndicator();
            } else if (state is PhotosInProgress) {
              return CircularProgressIndicator();
            } else if (state is PhotosFailure) {
              return Text(state.message);
            } else if (state is PhotosSuccess) {
              return _successBuild(context, state.photos);
            }
            return Text('Unknown photos bloc state $state');
          },
        ),
      ),
    );
  }

  Widget _successBuild(BuildContext context, List<Photo> photos) {
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: () async => await _onRefresh(context),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: photos
              .map(
                //convert state data to widget
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 2.5,
                  ),
                  child: PhotoTile(photo: e),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
