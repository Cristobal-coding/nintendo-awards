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
        appBar: AppBar(
          backgroundColor: zeldaBackground,
        ),
        body: Container(
          color: Colors.grey,
          child: FutureBuilder(
              future: zelda.getById('characters', nombre, id),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // color: Colors.blue,
                      height: size.height,
                      width: size.width,
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              padding: EdgeInsets.all(19),
                              height: size.height * 0.2,
                              // color: Colors.red,
                              child: Text(
                                "${snapshot.data['name']}",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontFamily: zeldaFontFamily,
                                    fontSize: 50),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: size.height * 0.43,
                              // color: Colors.green,
                              child: Center(
                                child: Text(
                                  "${snapshot.data['description']}",
                                  style: TextStyle(
                                      fontFamily: zeldaFontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.5),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: size.height * 0.032,
                              // color: Colors.white,
                              child: Row(
                                children: [
                                  (snapshot.data['race'] != null)
                                      ? Text(
                                          "Race: ${snapshot.data['race']}",
                                          style: TextStyle(
                                            fontFamily: zeldaFontFamily,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          "Race: No info.",
                                          style: TextStyle(
                                            fontFamily: zeldaFontFamily,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  Spacer(),
                                  (snapshot.data['gender'] != null)
                                      ? Text(
                                          "Gender: ${snapshot.data['gender']}",
                                          style: TextStyle(
                                            fontFamily: zeldaFontFamily,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : Text(
                                          "Gender: No info.",
                                          style: TextStyle(
                                            fontFamily: zeldaFontFamily,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            // color: Colors.green,
                            height: size.height * 0.125,
                            child: (snapshot.data['appearances'].length != 0)
                                ? FutureBuilder(
                                    future: zelda.getFirstGame(
                                        snapshot.data['appearances'][0]),
                                    builder: (context, snapshot2) {
                                      if (!snapshot2.hasData) {
                                        return Container(
                                          child: CircularProgressIndicator(),
                                        );
                                      } else {
                                        return Container(
                                          width: size.width,
                                          child: Column(
                                            children: [
                                              Text(
                                                "First Game Appearance",
                                                style: TextStyle(
                                                  fontFamily: zeldaFontFamily,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                  snapshot2.data['data']
                                                      ['name'],
                                                  overflow: TextOverflow
                                                      .ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontFamily:
                                                          zeldaFontFamily,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Spacer(),
                                              Text(
                                                "Total Appareances: ${snapshot.data['appearances'].length}",
                                                style: TextStyle(
                                                  fontFamily: zeldaFontFamily,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Publisher: ${snapshot2.data['data']['publisher']}",
                                                style: TextStyle(
                                                  fontFamily: zeldaFontFamily,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                "Year of release: ${snapshot2.data['data']['released_date']}",
                                                style: TextStyle(
                                                  fontFamily: zeldaFontFamily,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              )
                                              // Text("AAAAAAAAAAAAAAAAAAAAAAAAAA"),
                                            ],
                                          ),
                                        );
                                      }
                                    })
                                : Text(
                                    "This character hasn't appeared in a videogame yet.",
                                    style: TextStyle(
                                      fontFamily: zeldaFontFamily,
                                      fontWeight: FontWeight.bold,
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
