import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _imageData = ModalRoute.of(context).settings.arguments as String;
    // print(_imageData);
    return Scaffold(
      appBar: AppBar(
        title: Text('Image View'),
      ),
      body: Center(
        child: Container(
            child: CachedNetworkImage(
          imageUrl: _imageData,
          imageBuilder: (context, imageProvider) => PhotoView(
            imageProvider: imageProvider,
          ),
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) {
            print(error);
            return Icon(Icons.error);
          },
        )),
      ),
    );
  }
}
