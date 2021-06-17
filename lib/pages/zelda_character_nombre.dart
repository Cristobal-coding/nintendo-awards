import 'package:flutter/material.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/pages/provider/zelda_provider.dart';

class ZeldaCharacter extends StatelessWidget {
  final String nombre, id;
  const ZeldaCharacter({Key key, this.nombre, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ZeldaProvider zelda = new ZeldaProvider();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(),
        body: Container(
          child: FutureBuilder(
              future: zelda.getById('characters', nombre, id),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.blue,
                      height: size.height,
                      width: size.width,
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.2,
                            color: Colors.red,
                            child: Text(
                              "${snapshot.data['name']}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  fontFamily: zeldaFontFamily, fontSize: 50),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: size.height * 0.3,
                              color: Colors.green,
                              child: Text("${snapshot.data['description']}"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: size.height * 0.03,
                              color: Colors.white,
                              child: Row(
                                children: [
                                  (snapshot.data['race'] != null)
                                      ? Text("Race: ${snapshot.data['race']}")
                                      : Text("Race: No info."),
                                  Spacer(),
                                  (snapshot.data['gender'] != null)
                                      ? Text(
                                          "Gender: ${snapshot.data['gender']}")
                                      : Text("Gender: No info."),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }
              }),
        ));
  }
}
