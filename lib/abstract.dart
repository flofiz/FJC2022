import 'package:flutter/material.dart';

class PresPage extends StatelessWidget {
  String nom;
  String prenom;
  String resume;
  String titre;

  PresPage(
      {this.nom = "Doe",
      this.prenom = "John",
      this.resume = "Fais une thèse sur un sujet que personne ne comprend",
      this.titre = "Que personne ne comprend"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.titre),
      ),
      body: Column(children: [
        Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(this.nom + " " + this.prenom)),
        Expanded(
            flex: 1,
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical, //.horizontal
                child: Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20),
                    child: Text(this.resume))))
      ]),
    );
  }
}
