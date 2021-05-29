import 'package:flutter/material.dart';

import '../../models/photo_model.dart';
import 'cached_network_image_loader.dart';

///Tile in list of home page
class PhotoTile extends StatelessWidget {
  final Photo photo;
  final String heroTag;

  final Function()? onTap;
  final double radius;
  final Duration animationDuration;

  const PhotoTile({
    Key? key,
    required this.photo,
    this.onTap,
    required this.heroTag,
    this.radius = 8.0,
    this.animationDuration = const Duration(milliseconds: 100),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: animationDuration,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black45,
            )
          ],
          borderRadius: BorderRadius.circular(radius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Column(
            children: [
              Hero(
                tag: heroTag,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 400),
                  child: CachedNetworkImageLoader(
                    url: photo.small,
                  ),
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
      ),
    );
  }
}
