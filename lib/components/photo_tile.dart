import 'package:flutter/material.dart';

import '../../models/photo_model.dart';
import 'network_image_blur_hash.dart';

///Tile in list of home page
class PhotoTile extends StatelessWidget {
  final Photo photo;

  final Function()? onTap;

  const PhotoTile({Key? key, required this.photo, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: 400),
              child: NetworkImageBlurHash(
                uri: photo.small,
                blurHash: photo.blurHash,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Created by: ${photo.userName}'),
                  Spacer(),
                  Icon(Icons.star),
                  Text(photo.likes != null ? photo.likes.toString() : '0'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
