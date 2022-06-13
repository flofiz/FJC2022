import 'package:fjc_2022/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fjc_2022/pres.dart';
import 'package:fjc_2022/day1.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' show utf8;
import 'package:csv/csv.dart';
import 'event.dart';
import 'package:time_planner/time_planner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'FJC2022'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<List<dynamic>> _data = [];
  var _data = <Pres>[];
  var _events = <Event>[];
  var to_show = <Event>[];
  int day_fliter = 0;

  void _loadCSV() async {
    var _rawData = await rootBundle.loadString("assets/Tableau_abstract2.csv");

    List<List<dynamic>> _listData =
        const CsvToListConverter(fieldDelimiter: ";")
            .convert(_rawData, eol: '\n');
    _listData.removeAt(0);
    for (var item in _listData) {
      _data.add(Pres(
        nom: item[0].toString(),
        prenom: item[1].toString(),
        resume: item[4].toString(),
        titre: item[2].toString(),
        lieu: item[9].toString(),
        debut: item[6].toString(),
        fin: item[7].toString(),
        jour: item[5].toString(),
        type: item[3].toString(),
        session: item[10].toString(),
      ));
    }

    _rawData = await rootBundle.loadString("assets/jeudi16.csv");

    _listData = const CsvToListConverter(fieldDelimiter: ";", eol: '\n')
        .convert(_rawData);
    _listData.removeAt(0);

    for (var item in _listData) {
      if (item[0] == "Posters") {
        _events.add(Event(
            nom: item[0],
            heure: item[1],
            minutes: item[2],
            duree: item[3],
            jour: item[5],
            dureeJour: item[6],
            theme: item[7],
            engTheme: item[8],
            type: item[9],
            presentations: _data
                .where((Pres) => Pres.type == 'Poster' && Pres.jour == '1')
                .toList()));
      } else {
        _events.add(Event(
            nom: item[0],
            heure: item[1],
            minutes: item[2],
            duree: item[3],
            jour: item[5],
            dureeJour: item[6],
            theme: item[7],
            engTheme: item[8],
            type: item[9],
            presentations:
                _data.where((Pres) => Pres.session == item[8]).toList()));
      }
    }

    setState(() {
      _data = _data;
      _events = _events;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCSV();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    // List<TimePlannerTask> to_show =
    //     _events.where((Event) => Event.jour == 1).toList();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      // Menu pour accéder à toutes les différentes pages
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
                leading: Icon(Icons.input),
                title: Text('Home page'),
                onTap: () => {
                      Navigator.of(context).pop(),
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()))
                    }),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Day 1'),
              onTap: () => {
                setState(() {
                  day_fliter = 0;
                }),
                Navigator.of(context).pop(),
              },
            ),
            ListTile(
              leading: Icon(Icons.verified_user),
              title: Text('Day 2'),
              onTap: () => {
                setState(() {
                  day_fliter = 1;
                }),
                Navigator.of(context).pop(),
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Day 3'),
              onTap: () => {
                setState(() {
                  day_fliter = 2;
                }),
                Navigator.of(context).pop()
              },
            ),
            ListTile(
              leading: Icon(Icons.border_color),
              title: Text('Saved'),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
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
          tasks: _events,

          style: TimePlannerStyle(showScrollBar: true),
        ),
      ),
    );
  }
}
