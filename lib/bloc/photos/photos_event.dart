part of 'photos_bloc.dart';

abstract class PhotosEvent extends Equatable {
  const PhotosEvent();

  @override
  List<Object> get props => [];
}

class PhotosRequested extends PhotosEvent {
  final int page;

  PhotosRequested({this.page = 1});

  @override
  List<Object> get props => [page];
}

class PhotosSearch extends PhotosEvent {
  final String query;
  final int page;

  PhotosSearch({this.page = 1, required this.query});

  @override
  List<Object> get props => [page, query];
}
