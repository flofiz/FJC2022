import 'package:flutter/material.dart';
import 'session.dart';
import 'pres.dart';
import 'package:time_planner/time_planner.dart';

class Event extends TimePlannerTask {
  final String nom;
  final int heure;
  final int minutes;
  final int duree;
  final int jour;
  final int dureeJour;
  final String theme;
  final String engTheme;
  final List<Pres> presentations;

  Event(
      {required this.nom,
      required this.heure,
      required this.minutes,
      required this.duree,
      required this.jour,
      required this.dureeJour,
      required this.theme,
      required this.engTheme,
      required this.presentations})
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
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SessionPage(
                      session: engTheme,
                      to_show: presentations,
                    )))
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
