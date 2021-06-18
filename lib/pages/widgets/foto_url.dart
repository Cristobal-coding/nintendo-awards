import 'package:flutter/material.dart';

import '../../constants.dart';

class FotoUrl extends StatelessWidget {
  const FotoUrl({
    Key key,
    this.pathImage,
  }) : super(key: key);
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      pathImage, //'url entre comillas'
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            // backgroundColor: Colors.red,
            valueColor: AlwaysStoppedAnimation<Color>(nintendoPrimaryColor),
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
    );
  }
}
