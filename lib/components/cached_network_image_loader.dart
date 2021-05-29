import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

///Shows network image. When loading in progress shows blur hash image
class CachedNetworkImageLoader extends StatelessWidget {
  ///How to inscribe the image into the space allocated during layout
  final BoxFit fit;

  ///Image source
  final String url;

  const CachedNetworkImageLoader({
    Key? key,
    required this.url,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
          value: downloadProgress.progress,
        ),
      ),
    );
  }
}
