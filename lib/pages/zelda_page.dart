import 'package:flutter/material.dart';
import 'package:nintendo_awards/constants.dart';
import 'package:nintendo_awards/pages/provider/zelda_provider.dart';

class ZeldaPage extends StatelessWidget {
  const ZeldaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ZeldaProvider zelda = new ZeldaProvider();
    // return Column(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Container(
    //         width: size.width,
    //         height: size.height * 0.7,
    //         child: ListView(),
    //         color: Colors.blue,
    //       ),
    //     )
    //   ],
    // );
    return Center(
      child: Container(
        width: 500,
        height: 500,
        child: FutureBuilder(
          future: zelda.getById('characters', 'Anjean','5f6d186f246bd9a0809d6115'),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                separatorBuilder: (_, __) => Divider(),
                itemCount:1,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data['name']),
                    subtitle: Text(snapshot.data['gender']),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
