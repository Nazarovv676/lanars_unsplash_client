import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/photo_model.dart';
import '../../../repos/api_repo.dart';
import '../../../exceptions/api_exception.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final ApiRepo apiRepo;
  PhotosBloc({required this.apiRepo}) : super(PhotosInitial());

  @override
  Stream<PhotosState> mapEventToState(PhotosEvent event) async* {
    if (event is PhotosRequested) {
      yield PhotosInProgress();
      try {
        final photos = await apiRepo.photos(page: event.page);
        yield PhotosSuccess(photos: photos);
      } on ApiException catch (e) {
        print(e);
        yield PhotosFailure(message: e.message);
      } catch (e) {
        print(e);
        yield PhotosFailure(message: e.toString());
      }
    }
    if (event is PhotosSearch) {
      yield PhotosInProgress();
      try {
        final photos = await apiRepo.searchPhotos(event.query, event.page);
        yield PhotosSuccess(photos: photos);
      } on ApiException catch (e) {
        print(e);
        yield PhotosFailure(message: e.message);
      } catch (e) {
        print(e);
        yield PhotosFailure(message: e.toString());
      }
    }
  }
}
