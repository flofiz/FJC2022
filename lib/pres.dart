import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fjc_2022/prespage.dart';

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
      this.jour = "0"});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
          child: Card(
              margin: const EdgeInsets.all(4),
              color: Colors.white,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(this.debut)),
                          Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(this.fin))
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Expanded(
                                    child: Text(this.nom + " " + this.prenom,
                                        overflow: TextOverflow.ellipsis))),
                          ),
                          Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Expanded(
                                      child: Text(this.titre,
                                          softWrap: false,
                                          maxLines: 3,
                                          style: TextStyle(fontSize: 10),
                                          overflow: TextOverflow.ellipsis))))
                        ],
                      ),
                    ],
                  )))),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PresPage(
                nom: nom, prenom: prenom, resume: resume, titre: titre)));
      },
    );
  }
}
// child: Container(
//         height: 56.0, // in logical pixels
//         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//         decoration: BoxDecoration(),
//         // Row is a horizontal, linear layout.
//         child: Column(
//           // <Widget> is the type of items in the list.
//           children: [Text(this.nom + " " + this.prenom), Text(this.titre)],
//         ),
//       ),