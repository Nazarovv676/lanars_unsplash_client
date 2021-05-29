import 'package:flutter/material.dart';

import '../components/network_image_blur_hash.dart';
import '../../models/photo_model.dart';

class PhotoViewPage extends StatelessWidget {
  final Photo photo;
  final String heroTag;
  const PhotoViewPage({Key? key, required this.photo, required this.heroTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Hero(
          tag: heroTag,
          child: NetworkImageBlurHash(
            uri: photo.full,
            blurHash: photo.blurHash,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
