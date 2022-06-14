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
