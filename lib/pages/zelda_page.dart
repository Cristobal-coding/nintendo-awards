import 'package:flutter/material.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/pages/provider/zelda_provider.dart';

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
  bool noback = true;
  @override
  void initState() {
    super.initState();
    scrollCtrl.addListener(() {
      if (scrollCtrl.position.pixels == scrollCtrl.position.maxScrollExtent) {
        setState(() {
          paginaActual++;
          print(paginaActual);
        });
      }
      // if (nombreTxt == "") {}
    });
  }

  Future<List<dynamic>> cargarDatos(int numePagina, nom) async {
    var data = await zelda.getAllCharactersNom(numePagina, nom);

    //Lista sin filtro
    if (data != null && nom == '' && noback) {
      listaDatos.addAll(data['data']);
    }
    //Lista con filtro
    if (data != null && nom != '' && noback) {
      listaDatos.clear();
      listaDatos.addAll(data['data']);
    }
    //return lista sin filtro
    if (data != null && !noback) {
      listaDatos.clear();
      listaDatos.addAll(data['data']);
    }

    return listaDatos;
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(children: [
      // Container(
      //   color: Colors.grey,
      //   padding: EdgeInsets.only(top: 20),
      //   height: size.height * 0.02,
      //   child: Text(
      //     "The legend of Zelda Characters",
      //     style: TextStyle(
      //         fontWeight: FontWeight.bold,
      //         fontFamily: zeldaFontFamily,
      //         fontSize: 20),
      //   ),
      // ),
      Container(
        decoration: BoxDecoration(color: Colors.red),
        child: TextField(
          controller: nombreCtrl,
          decoration: InputDecoration(
              labelText: 'Nombre', hintText: 'Nombre del personaje'),
        ),
      ),
      Row(children: [
        Container(
          child: ElevatedButton(
            child: Text("Buscar"),
            onPressed: () {
              setState(() {
                paginaActual = 0;
                nombreTxt = nombreCtrl.value.text;
                print("Nombre: $nombreTxt");
              });
            },
          ),
        ),
        Spacer(),
        Container(
          child: ElevatedButton(
            child: Text("Mostrar todos los personajes."),
            onPressed: () {
              setState(() {
                nombreTxt = "";
                nombreCtrl.clear();
                paginaActual = 0;
                print("Nombre: $nombreTxt");
              });
            },
          ),
        ),
      ]),
      Spacer(),

      Container(
        width: size.width,
        height: size.height * 0.65,
        child: FutureBuilder(
          future: cargarDatos(paginaActual, nombreTxt),
          builder: (context, listaDatos) {
            if (!listaDatos.hasData ||
                (listaDatos.connectionState == ConnectionState.waiting &&
                    nombreTxt != "")) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                controller: scrollCtrl,
                separatorBuilder: (_, __) => Divider(),
                itemCount: listaDatos.data.length,
                itemBuilder: (context, index) {
                  // print(listaDatos.data['data']);
                  if (index == listaDatos.data.length) {
                    return Center(child: LinearProgressIndicator());
                    // if (datosLeft) {
                    //   return Center(child: LinearProgressIndicator());
                    // } else {
                    //   return Center(
                    //     child: Text("No quedan mas datos."),
                    //   );
                    // }
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          width: size.width,
                          height: size.height * 0.2,
                          color: Colors.red,
                          child: Column(children: [
                            ListTile(
                                title: Text(
                                  listaDatos.data[index]['name'],
                                  style: TextStyle(
                                    fontFamily: zeldaFontFamily,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle:
                                    (listaDatos.data[index]['gender'] != null)
                                        ? Text(listaDatos.data[index]['gender'])
                                        : Text("No info.")),
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: Text(
                                listaDatos.data[index]['description'],
                                style: TextStyle(fontFamily: zeldaFontFamily),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(children: [
                                Container(
                                  color: Colors.blue,
                                  child: Text(
                                    'Apariciones: ${listaDatos.data[index]['appearances'].length}',
                                    style:
                                        TextStyle(fontFamily: zeldaFontFamily),
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  child: Text(
                                    'Raza: ${(listaDatos.data[index]['race'] != null) ? (listaDatos.data[index]['race']) : ("No info.")}',
                                    style:
                                        TextStyle(fontFamily: zeldaFontFamily),
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
    ]);
  }
}
