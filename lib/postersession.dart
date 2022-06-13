import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:fjc_2022/pres.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class PosterPage extends StatelessWidget {
  final String session;
  final List<Pres> to_show;
  final int jour;
  const PosterPage(
      {Key? key,
      required this.session,
      required this.to_show,
      required this.jour})
      : super(key: key);

  // récupère les diférentes thématiques de session poster
  List getPosterSession(to_show) {
    var all_session = [];
    for (var item in to_show) {
      if (item.jour == jour.toString()) {
        if (!all_session.contains(item.session)) {
          all_session.add(item.session);
        }
      }
    }
    return all_session;
  }

  @override
  Widget build(BuildContext context) {
    // Les widget que je vais charger
    final children = <Widget>[];

    // Je récupère le nom des différentes sessions
    var all_sessions = getPosterSession(to_show);

    // Pour chaque session
    for (var session in all_sessions) {
      // Je récupère les participants
      List<Pres> new_to_show = to_show
          .where(
              (Pres) => Pres.session == session && Pres.jour == jour.toString())
          .toList();
      // Texte avec le thème de la session
      children.add(Text('\n' + session + '\n',
          style: TextStyle(fontWeight: FontWeight.bold)));

      // Liste des participants avec leur description
      children.add(
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: new_to_show.length,
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return new_to_show[index];
          },
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(session),
        ),
        body: SafeArea(
            child:
                SingleChildScrollView(child: Column(children: [...children]))));
  }
}
