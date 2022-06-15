import 'package:flutter/material.dart';

import 'day1.dart';

class ConfPage extends StatelessWidget {
  final conference;
  final heure;
  final minutes;

  ConfPage(
      {required this.conference, required this.heure, required this.minutes});

  @override
  Widget build(BuildContext context) {
    var children;
    if (conference == "Experimentarium panel") {
      children = Text('Vous aller participer à une démo expérimentarium');
    } else if (conference == "Post-doc panel") {
      children = Text('Conf sur le post doc');
    } else if (conference == "Conference") {
      children = Column(children: [
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Comment communiquer sa recherche à différents publics ? Formations et retours d'expériences",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
        SizedBox(height: 10),
        Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                "Coralie Biguzzi - Mission Culture Scientifique - Responsable des formations à l'Experimentarium et des Nuits européennes des Chercheurs à Dijon")),
        Text('https://www.experimentarium.fr/')
      ]);
    }

    return Scaffold(
      appBar: AppBar(
          title: Text(
              conference + '\n' + heure.toString() + 'h' + minutes.toString(),
              textAlign: TextAlign.center)),
      body: children,
    );
  }
}
