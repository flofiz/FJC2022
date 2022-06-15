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
    } else if (conference == "Post-doc panel") {
      children = Text(
          "la Bourgogne Franche-Comté dispose d'un continuum d'accompagnement à destination des porteurs de projet qui souhaitent se lancer dans l'entrepreneuriat. Venez découvrir les acteurs et dispositifs qui soutiennent les doctorants et jeunes chercheurs dans leur création d'entreprise.");
    } else if (conference == "Conference") {
      children =
          Text("Conférence sur l'impact de la recherche sur l'environnement");
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
