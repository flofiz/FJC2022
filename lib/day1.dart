import 'package:csv/csv.dart';
import 'package:fjc_2022/homepage.dart';
import 'package:flutter/services.dart';
import 'package:time_planner/time_planner.dart';
import 'package:flutter/material.dart';
import 'package:fjc_2022/pres.dart';
import 'package:fjc_2022/session.dart';

class Day1 extends StatelessWidget {
  // Liste des tâches qui est appelé par le TimePlanner
  List<TimePlannerTask> tasks = [];

  // Leture du fichier csv pour le Jeudi
  // Structure : 0: Nom | 1: Heure debut | 2: Minutes debut| 3: Duree en min |
  //  4: Salle | 5: Jour (0: Orbigny, 1: Ampère, 2: R3) | 6: Duree jour | 7: Thème
  void _loadCSV(BuildContext context) async {
    var _rawData = await rootBundle.loadString("assets/jeudi16.csv");

    List<List<dynamic>> _listData =
        const CsvToListConverter(fieldDelimiter: ";")
            .convert(_rawData, eol: '\n');
    _listData.removeAt(0);

    // Création d'un objet TimePlannerTask par ligne
    for (var item in _listData) {
      _addObject(item[0], item[1], item[2], item[3], item[5], item[6], item[7],
          context, item[9]);
    }
  }

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

  // Créé et ajoute un objet à la liste tasks
  void _addObject(nom, heure, minutes, duree, jour, dureeJour, theme,
      BuildContext context, engTheme) {
    tasks.add(
      TimePlannerTask(
        color: getCouleur(theme),
        dateTime: TimePlannerDateTime(
          day: jour,
          hour: heure,
          minutes: minutes,
        ),
        onTap: () => {
          Navigator.of(context).pop(),
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SessionPage(
                        session: engTheme,
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
      ),
    );
  }
  // setState(() {’
  //   _data = _data;
  // });

  @override
  Widget build(BuildContext context) {
    _loadCSV(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Planning Jeudi 16 Juin'),
        centerTitle: true,
      ),
      body: Center(
        child: TimePlanner(
          // time will be start at this hour on table
          startHour: 8,
          // time will be end at this hour on table
          endHour: 22,
          // each header is a column and a day
          headers: [
            TimePlannerTitle(
              date: " ",
              title: "Orbigny",
            ),
            TimePlannerTitle(
              date: "",
              title: "Ampère",
            ),
            TimePlannerTitle(
              date: " ",
              title: "Salle R3",
            ),
          ],
          // List of task will be show on the time planner
          tasks: tasks,

          style: TimePlannerStyle(showScrollBar: true),
        ),
      ),
    );
  }
}
