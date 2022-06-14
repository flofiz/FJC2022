import 'package:flutter/material.dart';
import 'session.dart';
import 'pres.dart';
import 'package:time_planner/time_planner.dart';
import 'package:fjc_2022/postersession.dart';
import 'package:fjc_2022/homepage.dart';
import 'package:fjc_2022/confpage.dart';

class Event extends TimePlannerTask {
  final String nom;
  final int heure;
  final int minutes;
  final int duree;
  final int jour;
  final int dureeJour;
  final String theme;
  final String engTheme;
  final String type;
  final List<Pres> presentations;
  final int jour_pres;

  Event(
      {required this.nom,
      required this.heure,
      required this.minutes,
      required this.duree,
      required this.jour,
      required this.dureeJour,
      required this.theme,
      required this.engTheme,
      required this.type,
      required this.presentations,
      required this.jour_pres})
      : super(
            minutesDuration: duree,
            dateTime: TimePlannerDateTime(
              day: jour,
              hour: heure,
              minutes: minutes,
            ));

  // Détermine la couleur de la case en fonction du thème
  MaterialColor getCouleur(theme) {
    if (theme == 'Santé') {
      return Colors.blue;
    } else if (theme == 'Environnement') {
      return Colors.green;
    } else if (theme == 'Pause') {
      return Colors.grey;
    } else if (theme == 'Table ronde') {
      return Colors.amber;
    } else if (theme == 'Posters') {
      return Colors.purple;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TimePlannerTask(
      color: getCouleur(theme),
      dateTime: TimePlannerDateTime(
        day: jour,
        hour: heure,
        minutes: minutes,
      ),
      onTap: () => {
        // Navigator.of(context).pop(),
        if (type == "Posters")
          {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PosterPage(
                          session: engTheme,
                          to_show: presentations,
                          jour: jour_pres,
                        )))
          }
        else if (type == "Conf")
          {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ConfPage(
                          conference: engTheme,
                          heure: heure,
                          minutes: minutes,
                        )))
          }
        else if (engTheme != "Break")
          {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SessionPage(
                          session: engTheme,
                          to_show: presentations,
                        )))
          }
      },
      minutesDuration: duree,
      daysDuration: dureeJour,
      child: Text(nom,
          style: TextStyle(
            color: Colors.grey[350],
            fontSize: 12,
          ),
          textAlign: TextAlign.center),
    );
  }
}
