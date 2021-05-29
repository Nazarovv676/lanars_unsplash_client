part of 'photos_bloc.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();

  @override
  List<Object> get props => [];
}

class PhotosInitial extends PhotosState {}

class PhotosInProgress extends PhotosState {}

class PhotosFailure extends PhotosState {
  final String message;

  PhotosFailure({required this.message}) : assert(message != null);

  @override
  List<Object> get props => [message];
}

class PhotosSuccess extends PhotosState {
  final List<Photo> photos;

  PhotosSuccess({required this.photos}) : assert(photos != null);
}
