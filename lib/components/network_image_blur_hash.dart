import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

///Shows network image. When loading in progress shows blur hash image
class NetworkImageBlurHash extends StatelessWidget {
  ///How to inscribe the image into the space allocated during layout
  final BoxFit fit;

  ///Blur hash string
  final String blurHash;

  ///Image source
  final String uri;

  const NetworkImageBlurHash({
    Key? key,
    required this.uri,
    required this.blurHash,
    this.fit = BoxFit.cover,
  })  : assert(blurHash != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      uri,
      fit: fit,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          height: 400,
          child: Stack(
            children: [
              BlurHash(hash: blurHash),
              Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
