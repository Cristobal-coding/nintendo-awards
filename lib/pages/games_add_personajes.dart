import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/pages/provider/mario_provider.dart';
import 'package:nintendo_awards/pages/widgets/hongo_progress_indicator.dart';

class GamesAddPersonajes extends StatefulWidget {
  GamesAddPersonajes({
    Key key,
    this.nombre,
    this.id,
    this.personajes,
  }) : super(key: key);
  final int id;
  final String nombre;
  final List<dynamic> personajes;

  @override
  _GamesAddPersonajesState createState() => _GamesAddPersonajesState();
}

class _GamesAddPersonajesState extends State<GamesAddPersonajes> {
  MarioProvider mario = new MarioProvider();
  List<String> personajesChecked = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i in widget.personajes) {
      // print("entro: ${i["nombre"]}");
      personajesChecked.add(i["nombre"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Personajes"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            height: size.height * 0.85,
            child: Column(children: [
              Container(
                  height: size.height * 0.03,
                  child: Text(
                    "Gestionar personajes de: ",
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                  width: size.width,
                  height: size.height * 0.05,
                  child: FittedBox(
                    child: Text(
                      "${widget.nombre}",
                      style: TextStyle(
                          fontSize: 20, decoration: TextDecoration.underline),
                    ),
                  )),
              Container(

                  // color: Colors.red,
                  height: size.height * 0.6,
                  child: FutureBuilder(
                      future: mario.getAll('personajes'),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.separated(
                              separatorBuilder: (_, __) => Divider(),
                              itemCount: snapshot.data['results'].length,
                              itemBuilder: (context, index) {
                                if (index == snapshot.data['results'].length) {
                                  return Center(
                                      child: HongoProgressIndicator(font: 50));
                                } else {
                                  return CheckboxListTile(
                                    activeColor: nintendoPrimaryColor,
                                    value: personajesChecked.contains(snapshot
                                        .data['results'][index]['nombre']),
                                    title: Text(snapshot.data['results'][index]
                                        ['nombre']),
                                    onChanged: (value) {
                                      if (value) {
                                        setState(() {
                                          return personajesChecked.add(
                                              snapshot.data['results'][index]
                                                  ['nombre']);
                                        });
                                      } else {
                                        setState(() {
                                          return personajesChecked.remove(
                                              snapshot.data['results'][index]
                                                  ['nombre']);
                                        });
                                      }
                                      print(personajesChecked);
                                    },
                                  );
                                }
                              });
                        }
                      })),
              Spacer(),
              Container(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: nintendoPrimaryColor
                  ),
                  onPressed: () {
                    addAllPersonajes(context);
                  },
                  child: Text("Añadir personajes"),
                ),
              )
            ]),
          ),
        )
      ]),
    );
  }

  void addAllPersonajes(BuildContext context) async {
    MarioProvider mario = new MarioProvider();
    await mario.addElementPivot(widget.id, personajesChecked);
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(MdiIcons.alertCircleCheckOutline, color: Colors.white),
              Text(
                ' Personajes Actualizados.',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          backgroundColor: nintendoStar,
        ),
      );
      Navigator.pop(
        context,
      );
    });
  }
}
