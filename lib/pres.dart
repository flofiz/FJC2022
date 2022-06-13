// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fjc_2022/abstract.dart';

class Pres extends StatelessWidget {
  String nom;
  String prenom;
  String resume;
  String titre;
  String debut;
  String fin;
  String jour;
  String lieu;
  String type;
  String session;

  Pres(
      {this.nom = "Nom",
      this.prenom = "Prenom",
      this.type = "rien",
      this.resume =
          "détaille plus long de la présentation ou abstract on verra ce qu'on met dedans mais j'ecris pour que ca fasse du volume",
      this.titre = "Titre de la présentation",
      this.lieu = "Lieu",
      this.debut = "0.0",
      this.fin = "0.0",
      this.jour = "0",
      this.session = "Session"});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: const EdgeInsets.all(4),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(this.nom + " " + this.prenom,
                      overflow: TextOverflow.ellipsis)),
            ),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(this.titre,
                        softWrap: false,
                        maxLines: 3,
                        style: TextStyle(fontSize: 10),
                        overflow: TextOverflow.ellipsis)))
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PresPage(
                nom: nom, prenom: prenom, resume: resume, titre: titre)));
      },
    );
  }
}
