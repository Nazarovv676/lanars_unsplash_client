import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lanars_unsplash_client/pages/photo_view_page.dart';

import '../models/photo_model.dart';
import '../bloc/photos/photos_bloc.dart';
import '../components/photo_tile.dart';

class HomePage extends StatelessWidget {
  final rand = Random();
  final _searchTextController = TextEditingController();
  HomePage({Key? key}) : super(key: key);

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PhotosBloc>(context).add(PhotosRequested(
      page: rand.nextInt(100),
    ));
    _searchTextController.clear();
    FocusScope.of(context).unfocus();
  }

  _onSearch(BuildContext context) {
    if (_searchTextController.text.isNotEmpty) {
      BlocProvider.of<PhotosBloc>(context).add(PhotosSearch(
        query: _searchTextController.text,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _searchTextController,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: 'Search',
                hintText: 'Some text',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => _onSearch(context),
                )),
          ),
        ),
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

  void _onPhotoTap(BuildContext context, Photo photo) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => PhotoViewPage(
          photo: photo,
          heroTag: photo.full,
        ),
      ),
    );
  }

  Widget _successBuild(BuildContext context, List<Photo> photos) {
    return RefreshIndicator(
      onRefresh: () async => await _onRefresh(context),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: photos
              .map(
                // convert state data to widget
                (photo) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                    vertical: 2.5,
                  ),
                  child: PhotoTile(
                    photo: photo,
                    onTap: () => _onPhotoTap(context, photo),
                    heroTag: photo.full,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
