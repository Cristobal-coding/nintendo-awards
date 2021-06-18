import 'package:flutter/material.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/icons_bottom_nav_icons.dart';
import 'package:nintendo_awards/pages/provider/zelda_provider.dart';
import 'package:nintendo_awards/pages/widgets/foto_url.dart';
import 'package:progress_indicators/progress_indicators.dart';

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
          title: FittedBox(
            child: Text(
              "Character's detail.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: zeldaFontFamily,
              ),
            ),
          ),
        ),
        body: Container(
          child: FutureBuilder(
              future: zelda.getById('characters', nombre, id),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: GlowingProgressIndicator(
                          child: Icon(
                    IconsBottomNav.triforce,
                    size: 100,
                  )));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Color(0xFF2E2523)),
                      height: size.height,
                      width: size.width,
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              // color: Colors.red,
                              width: double.infinity,
                              height: size.height * 0.2,
                              // color: Colors.red,
                              child: Stack(clipBehavior: Clip.none, children: [
                                Container(
                                  // color: Colors.red,
                                  width: size.width * 0.9,
                                  padding: EdgeInsets.all(19),
                                  child: Text(
                                    "${snapshot.data['name']}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontFamily: zeldaFontFamily,
                                        fontSize: 50,
                                        color: Colors.white),
                                  ),
                                ),
                                Positioned(
                                  height: size.height * 0.115,
                                  width: size.width * 0.1,
                                  top: 0,
                                  right: 10,
                                  child: FotoUrl(
                                    pathImage:
                                        'https://freepngimg.com/thumb/nintendo/83833-tri-force-symmetry-of-zelda-triforce-triangle-thumb.png',
                                  ),
                                ),
                              ]),
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
                                      fontSize: 14.5,
                                      color: Colors.white),
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
                                              color: Colors.white),
                                        )
                                      : Text(
                                          "Race: No info.",
                                          style: TextStyle(
                                              fontFamily: zeldaFontFamily,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                  Spacer(),
                                  (snapshot.data['gender'] != null)
                                      ? Text(
                                          "Gender: ${snapshot.data['gender']}",
                                          style: TextStyle(
                                              fontFamily: zeldaFontFamily,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      : Text(
                                          "Gender: No info.",
                                          style: TextStyle(
                                              fontFamily: zeldaFontFamily,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.zero,
                                  topRight: Radius.zero,
                                  bottomLeft: Radius.circular(13.0),
                                  bottomRight: Radius.circular(13.0),
                                ),
                                color: Color(0xFF2e7122)),
                            height: size.height * 0.125,
                            width: double.infinity,
                            child: (snapshot.data['appearances'].length != 0)
                                ? FutureBuilder(
                                    future: zelda.getFirstGame(
                                        snapshot.data['appearances'][0]),
                                    builder: (context, snapshot2) {
                                      if (!snapshot2.hasData) {
                                        return Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: GlowingProgressIndicator(
                                              child: Icon(
                                            IconsBottomNav.triforce,
                                            size: 100,
                                          )),
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
                                                  color: Color(0xFFfae906),
                                                ),
                                              ),
                                              FittedBox(
                                                child: Text(
                                                    snapshot2.data['data']
                                                        ['name'],
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      fontFamily:
                                                          zeldaFontFamily,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFFfae906),
                                                    )),
                                              ),
                                              Spacer(),
                                              Text(
                                                "Total Appareances: ${snapshot.data['appearances'].length}",
                                                style: TextStyle(
                                                  fontFamily: zeldaFontFamily,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFfae906),
                                                ),
                                              ),
                                              FittedBox(
                                                child: Text(
                                                  "Publisher: ${snapshot2.data['data']['publisher']}",
                                                  style: TextStyle(
                                                    fontFamily: zeldaFontFamily,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFFfae906),
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Year of release: ${snapshot2.data['data']['released_date']}",
                                                style: TextStyle(
                                                  fontFamily: zeldaFontFamily,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFfae906),
                                                ),
                                              )
                                              // Text("AAAAAAAAAAAAAAAAAAAAAAAAAA"),
                                            ],
                                          ),
                                        );
                                      }
                                    })
                                : Center(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        "This character hasn't appeared in a videogame yet.",
                                        style: TextStyle(
                                          fontFamily: zeldaFontFamily,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFfae906),
                                        ),
                                      ),
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
