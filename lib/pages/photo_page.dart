import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoPage extends StatelessWidget {
  // ignore: prefer_final_parameters
  const PhotoPage(this.imageUrl, {final Key key}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PhotoView(
              imageProvider: NetworkImage(imageUrl),
              backgroundDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              loadingBuilder:
                  (final BuildContext context, final ImageChunkEvent event) =>
                      Center(
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(
                    value: event == null
                        ? 0
                        : event.cumulativeBytesLoaded /
                            event.expectedTotalBytes,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
