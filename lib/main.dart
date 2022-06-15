import 'package:fjc_2022/homepage.dart';
import 'package:flutter/material.dart';
import 'package:fjc_2022/pres.dart';
import 'package:fjc_2022/day1.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' show utf8;
import 'package:csv/csv.dart';
import 'event.dart';
import 'package:time_planner/time_planner.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FJC2022',
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
  var _events = <Event>[];

  void _loadCSV() async {
    var _data = <Pres>[];
    var _rawData =
        await rootBundle.loadString("assets/Tableau_abstract2_1.csv");

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
            jour_pres: item[10],
            presentations:
                _data.where((Pres) => Pres.type == 'Poster').toList()));
      } else if (item[11] == 1) {
        _events.add(Event(
            nom: item[0] + '\n' + item[4],
            heure: item[1],
            minutes: item[2],
            duree: item[3],
            jour: item[5],
            dureeJour: item[6],
            theme: item[7],
            engTheme: item[8],
            type: item[9],
            jour_pres: item[10],
            presentations:
                _data.where((Pres) => Pres.session == item[8]).toList()));
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
            jour_pres: item[10],
            presentations:
                _data.where((Pres) => Pres.session == item[8]).toList()));
      }
    }

    setState(() {
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
    return HomePage(data: _events);
  }
}
