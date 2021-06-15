import 'package:flutter/material.dart';
import 'package:nintendo_awards/constants.dart';

class MarioPage extends StatelessWidget {
  const MarioPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: size.width,
        height: size.height * 0.4,
        color: Colors.blue,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.green,
                  width: size.width * 0.55,
                  height: size.height * 0.4,
                  child: Column(
                    children: [
                      Container(
                        width: size.width * 0.55,
                        height: size.height * 0.1,
                        color: Colors.red,
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Titulo poooooooooooooo ",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: size.height * 0.24,
                          width: size.width * 0.5,
                          color: Colors.white,
                          child: Image.network(
                            'https://i.imgur.com/yuz1Cuu.jpg',
                            // height: size.height * 0.24, //'url entre comillas'
                            // width: size.width * 0.5,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  // backgroundColor: Colors.red,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      nintendoPrimaryColor),
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
