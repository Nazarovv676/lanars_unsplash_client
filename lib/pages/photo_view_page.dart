import 'package:flutter/material.dart';
import 'package:dismissible_page/dismissible_page.dart';

import '../components/cached_network_image_loader.dart';
import '../../models/photo_model.dart';

class PhotoViewPage extends StatelessWidget {
  final Photo photo;
  final String heroTag;
  const PhotoViewPage({Key? key, required this.photo, required this.heroTag})
      : super(key: key);

  void _onClose(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return DismissiblePage(
      direction: DismissDirection.down,
      onDismiss: () => _onClose(context),
      child: Material(
        color: Colors.black,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Center(
              child: Container(
                height: double.infinity,
                child: InteractiveViewer(
                  child: Hero(
                    tag: heroTag,
                    child: CachedNetworkImageLoader(
                      url: photo.full,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: IconButton(
                onPressed: () => _onClose(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
