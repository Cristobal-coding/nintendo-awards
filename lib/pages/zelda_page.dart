import 'package:flutter/material.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/pages/provider/zelda_provider.dart';
import 'package:nintendo_awards/pages/widgets/triforce_progress_indicator.dart';
import 'package:nintendo_awards/pages/zelda_character_nombre.dart';

class ZeldaPage extends StatefulWidget {
  const ZeldaPage({Key key}) : super(key: key);

  @override
  _ZeldaPageState createState() => _ZeldaPageState();
}

class _ZeldaPageState extends State<ZeldaPage> {
  ZeldaProvider zelda = new ZeldaProvider();
  ScrollController scrollCtrl = new ScrollController();
  int paginaActual = 0;
  List<dynamic> listaDatos = [];
  String nombreTxt = '';
  TextEditingController nombreCtrl = new TextEditingController();
  bool noClear = false;
  bool refresh = false;
  bool showProgres = true;
  @override
  void initState() {
    super.initState();
    scrollCtrl.addListener(() {
      if (scrollCtrl.position.pixels == scrollCtrl.position.maxScrollExtent) {
        paginaActual++;
        setState(() {});
      }
    });
  }

  Future<List<dynamic>> cargarDatos(int numePagina, nom, bool refrescar) async {
    var data = await zelda.getAllCharactersNom(numePagina, nom);
    //Lista sin filtro
    if (data != null && nom == '' && !refrescar) {
      // print("Entro 1 ");
      listaDatos.addAll(data['data']);
      showProgres = false;
    }
    //Lista con filtro
    if (data != null && nom != '' && !refrescar) {
      // print("Entro 2 ");
      if (noClear) {
        listaDatos.clear();
        noClear = false;
        showProgres = false;
      }
      listaDatos.addAll(data['data']);
    }
    //return lista sin filtro
    if (data != null && refrescar) {
      // print("Entro 3");
      listaDatos.clear();
      listaDatos.addAll(data['data']);
      refresh = false;
      showProgres = false;
    }

    return listaDatos;
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Container(
            height: size.height * 0.07,
            decoration: BoxDecoration(),
            child: TextField(
              enabled: true,
              controller: nombreCtrl,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                ),
                labelText: 'Busqueda',
                labelStyle: TextStyle(
                    fontFamily: zeldaFontFamily,
                    // fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: zeldaBackground),
                hintText: 'Nombre del personaje',
                hintStyle: TextStyle(
                  fontFamily: zeldaFontFamily,
                  // fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: zeldaBackground,
                ),
                child: Text(
                  "Buscar",
                  style: TextStyle(
                    fontFamily: zeldaFontFamily,
                    // fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    showProgres = true;
                    paginaActual = 0;
                    noClear = true;
                    nombreTxt = nombreCtrl.value.text;
                    print("Nombre: $nombreTxt");
                  });
                },
              ),
            ),
            Spacer(),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: zeldaBackground,
                ),
                child: Text(
                  "Mostrar todos los personajes.",
                  style: TextStyle(
                    fontFamily: zeldaFontFamily,
                    // fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    showProgres = true;
                    noClear = true;
                    refresh = true;
                    nombreTxt = "";
                    nombreCtrl.clear();
                    paginaActual = 0;
                  });
                },
              ),
            )
          ],
        ),
      ),
      Expanded(
        child: Container(
          width: size.width,
          height: size.height * 0.6237,
          child: FutureBuilder(
            future: cargarDatos(paginaActual, nombreTxt, refresh),
            builder: (context, listaDatos) {
              if (!listaDatos.hasData ||
                  (listaDatos.connectionState == ConnectionState.waiting &&
                      showProgres)) {
                return Center(child: TriforceProgressIndicator(font: 100));
              } else {
                return ListView.separated(
                  controller: scrollCtrl,
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: listaDatos.data.length,
                  itemBuilder: (context, index) {
                    if (index == listaDatos.data.length) {
                      return Center(child: LinearProgressIndicator());
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            goShowCharacter(
                                context,
                                listaDatos.data[index]['name'],
                                listaDatos.data[index]['_id']);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Color(0xFF2e7122),
                            ),
                            width: size.width,
                            height: size.height * 0.2,
                            child: Column(children: [
                              Container(
                                padding: EdgeInsets.only(
                                    top: 2, left: 20, right: 20),
                                width: double.infinity,
                                height: size.height * 0.04,
                                child: FittedBox(
                                  child: Text(
                                    listaDatos.data[index]['name'],
                                    style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      fontFamily: zeldaFontFamily,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 12),
                                  width: double.infinity,
                                  height: size.height * 0.03,
                                  child: (listaDatos.data[index]['gender'] !=
                                          null)
                                      ? Text(listaDatos.data[index]['gender'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))
                                      : Text("No gender info.",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold))),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.all(3.25),
                                child: Container(
                                  width: size.width * 0.9,
                                  child: Text(
                                    listaDatos.data[index]['description'],
                                    style: TextStyle(
                                        fontFamily: zeldaFontFamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(children: [
                                  Container(
                                    // color: Colors.blue,
                                    child: Text(
                                      'Apariciones: ${listaDatos.data[index]['appearances'].length}',
                                      style: TextStyle(
                                          fontFamily: zeldaFontFamily,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    child: Text(
                                      'Raza: ${(listaDatos.data[index]['race'] != null) ? (listaDatos.data[index]['race']) : ("No info.")}',
                                      style: TextStyle(
                                          fontFamily: zeldaFontFamily,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ]),
                              ),
                            ]),
                          ),
                        ),
                      );
                    }
                  },
                );
              }
            },
          ),
        ),
      ),
    ]);
  }

  void goShowCharacter(BuildContext context, String nombre, id) {
    final route = new MaterialPageRoute(
        builder: (context) => ZeldaCharacter(
              nombre: nombre,
              id: id,
            ));
    Navigator.push(context, route);
  }
}
